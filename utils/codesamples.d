import std.algorithm, std.array, std.conv,
std.exception, std.file, std.format,
std.path, std.process, std.stdio, std.regex;

immutable string samplesDir = "code";
enum modName = ctRegex!("module (.+?);");

void main(string[] args)
{
    //if (!exists(samplesDir)) mkdir(samplesDir);
    auto compilationResults = File("results.txt", "w");
    
    auto texFiles = filter!`endsWith(a.name,".tex")`(dirEntries("..",SpanMode.shallow)); 
    foreach(entry; texFiles)
    {
        auto name = baseName(entry.name);
        compilationResults.write("\n************", name, " **************************\n");
        auto file = File("../" ~ name, "r");
        
        bool inCode;
        string accumulator;
        int anonymous;
        string moduleName;
        
        foreach(line; file.byLine) // KeepTerminator.yes doesn't work?
        {
            if (line.startsWith("\\begin{dcode}") || line.startsWith("\\begin{ndcode}")) 
            {
                inCode = true;
                continue;
            }

            if (inCode && line.startsWith("module "))
            {
                auto m = match(line, modName);
                moduleName = to!string(m.captures[1]);
            }
                       
            if (inCode && (line.startsWith("\\end{dcode}") || line.startsWith("\\end{ndcode}")) )
            {
                if (moduleName.length) // name -> compilation. No name, no compilation.
                {
                    auto sampleName = moduleName ~ ".d";
                    auto sampleFile = File(sampleName, "w");
                    sampleFile.write(accumulator);
                    sampleFile.close();
                    
                    auto s = system("rdmd " ~ sampleName);
                    if (s != 0) s = system("rdmd --main " ~ sampleName);
                    
                    if (s == 0)
                        compilationResults.write(sampleName ~ ": OK\n");
                    else
                    {
                        if (moduleName.endsWith("_error"))
                            compilationResults.write(sampleName ~ ": OK (fail as expected).\n");
                        else
                            compilationResults.write(sampleName ~ ": ERROR!\n");
                        
                    }
                }
                else
                {
                    ++anonymous;
                }

                inCode = false;
                accumulator = "";
                moduleName = "";
            }
            
            if (inCode) accumulator ~= line ~ "\n";
        }
        
        compilationResults.write("\n");
        compilationResults.write("Found " ~ to!string(anonymous) ~ " anonymous samples (no compilation attempted).\n");
        compilationResults.write("********************************************************\n\n");
        anonymous = 0;
    }
    
    system("rm *.deps");
}    