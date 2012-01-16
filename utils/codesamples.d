import std.algorithm, std.array, std.conv,
std.exception, std.file, std.format,
std.path, std.process, std.stdio;

immutable string samplesDir = "code";

void main(string[] args)
{
    //if (!exists(samplesDir)) mkdir(samplesDir);
    auto compilationResults = File("results.txt", "w");
    
    auto texFiles = filter!`endsWith(a.name,".tex")`(dirEntries(".",SpanMode.shallow)); 
    foreach(entry; texFiles)
    {
        auto name = baseName(entry.name);
        writeln("Found ", name);
        auto file = File(name, "r");
        bool inCode;
        string accumulator;
        int num;
        bool firstLine;
        
        foreach(line; file.byLine) // KeepTerminator.yes doesn't work?
        {
            if (line.startsWith("\\begin{dcode}") || line.startsWith("\\begin{ndcode}")) 
            {
                inCode = true;
                ++num;
                writeln(num);
                firstLine = true;
            }
            
            if (line.startsWith("\\end{dcode}") || line.startsWith("\\end{ndcode}")) 
            {
                inCode = false;
                //auto path = buildNormalizedPath(getcwd(), samplesDir, name[0..$-4]~"_sample"~to!string(num)~".d");
                auto sampleName = name[0..$-4]~"_sample"~to!string(num)~".d";
                auto sampleFile = File(sampleName, "w");//, "w");
                sampleFile.write(accumulator);
                sampleFile.write("void main() {}\n");
                sampleFile.close();
                accumulator = "";
                //chdir(getcwd());
                
                auto s = system("dmd -run " ~ sampleName);
                compilationResults.write(sampleName ~ ": " ~ to!string(s==0) ~ "\n");
            }
            
            if (inCode && !firstLine) accumulator ~= line ~ "\n";
            if (firstLine) firstLine = false;
        }
    }
    
    system("rm *.o");
    system("rm *_sample*.d");

    //if (startsWith(line, "\\begin{D}", "\\begin{D-invisible}"))
}    