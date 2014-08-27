/**
Extract D code samples from the md file.

Usage: ./codesamples.d D-templates-tutorial.md
*/
module codesamples;

import std.algorithm: startsWith, endsWith;
//import std.array;
import std.conv: to;
import std.exception;
//import std.file;
//import std.format;
//import std.path;
import std.process: system;
import std.stdio;
//import std.range;
import std.regex: regex, match;

void main(string[] args)
{
    immutable string samplesDir = "code";
    enum modName = regex("module (.+?);");
    enforce(args.length == 2, "Need an input file name.");
    string fileName = args[1];
    //if (!exists(samplesDir)) mkdir(samplesDir);
    auto compilationResults = File("results.txt", "w");
    auto inputFile = File(fileName,"r");

    string[] fileNames;
    string[][string] sampleNames;
    bool[string] gotMain;

    bool inCode;
    string accumulator;
    string sampleName;
    int anonymousSamples;
    writeln("Scanning ", inputFile, "...");
    foreach(line; inputFile.byLine) // KeepTerminator.yes doesn't work?
    {
        if (line.startsWith("```{.d"))
        {
            inCode = true;
            continue;
        }

        if (inCode && line.startsWith("module "))
        {
            auto m = match(line, modName);
            sampleName = to!string(m.captures[1]);
        }

        if (inCode && line.startsWith("void main()") && sampleName != "")
            gotMain[sampleName~".d"] = true;

        if (inCode && line.startsWith("```"))
        {
            if (sampleName.length)
            {
                File sampleFile = File(sampleName ~ ".d", "w");
                sampleFile.write(accumulator);
                sampleFile.close();
                sampleNames[fileName] ~= (sampleName~".d");
                if ((sampleName~".d") !in gotMain)
                    gotMain[sampleName~".d"] = false;
            }
            else
            {
                anonymousSamples++;
            }

            inCode = false;
            accumulator = "";
            sampleName = "";
        }

        if (inCode) accumulator ~= line ~ "\n";
    }
    size_t named = sampleNames[fileName].length;
    writeln("Scanning done. ", named, " named samples found. ", anonymousSamples, " anonymous samples found.");

    // Now we have all samples extracted from all files. Let's compile them.
    writeln("Attempting global compilation round.");
    int success;
    compilationResults.write("\n************", fileName, " **************************\n");
    compilationResults.write("Found " ~ to!string(named) ~ " named samples.\n");

    foreach(sample; sampleNames[fileName])
    {
        write("Compiling ", sample, "... ");
        int compilationResult;

        if (sample in gotMain && gotMain[sample]) //got main
        {
            compilationResult = system("rdmd -w -wi " ~ sample);
        }
        else
        {
            compilationResult = system("rdmd --main -w -wi " ~ sample);
        }

        if (compilationResult == 0) // success
        {
            if (!sample.endsWith("_error.d"))
            {
                writeln("OK.");
                compilationResults.write(sample ~ ": OK\n");
                ++success;
            }
            else
            {
                writeln("*** ERROR *** (compiled OK, but should fail).");
                compilationResults.write(sample ~ ": *** ERROR *** (compiled OK, but should fail)\n");
            }
        }
        else // failure
        {
            if (sample.endsWith("_error.d"))
            {
                writeln("OK (fail as expected).");
                compilationResults.write(sample ~ ": OK (fail as expected).\n");
                ++success;
            }
            else
            {
                writeln("*** ERROR! ***");
                compilationResults.write(sample ~ ":  *** ERROR! ***\n");
            }
        }
    }

    writeln("Successful compilation for " ~ to!string(success) ~ " / " ~ to!string(named));
    compilationResults.write("\n");
    compilationResults.write("Successful compilation for " ~ to!string(success) ~ " / " ~ to!string(named) ~ "\n");
    compilationResults.write("\n");
    compilationResults.write("Found " ~ to!string(anonymousSamples) ~ " anonymous samples (no compilation attempted).\n");
    compilationResults.write("Total of " ~ to!string(anonymousSamples+named) ~ " samples found.\n");
    compilationResults.write("********************************************************\n\n");

}