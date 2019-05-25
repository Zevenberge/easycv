module easycv.opts;

import std.stdio;
import darg;
import optional.optional;

Optional!Options parseCommandLine(string[] args)
{
    try
    {
        return some(parseArgs!Options(args[1 .. $]));
    }
    catch (ArgParseError e)
    {
        writeln(e.msg);
        writeln(usage);
        return no!Options;
    }
    catch (ArgParseHelp e)
    {
        // Help was requested
        writeln(usage);
        write(help);
        return no!Options;
    }
}

@("If I pass no arguments, this is seen as invalid input")
unittest
{
    auto result = parseCommandLine(["easycv"]);
    assert(result == none, "No result should be returned.");
}

@("If I ask for help, I don't get any options back")
unittest
{
    auto result = parseCommandLine(["easycv", "-h"]);
    assert(result == none, "No result should be returned.");
}

@("If I comply to all of the required, then I get options back")
unittest
{
    auto result = parseCommandLine(["easycv", "my-fabulous-cv.json"]);
    assert(result != none, "A result should be returned.");
    assert(result.unwrap.filename == "my-fabulous-cv.json");
}

@("The default output file is cv.html")
unittest
{
    auto result = parseCommandLine(["easycv", "my-fabulous-cv.json"]);
    assert(result.unwrap.output == "cv.html");
}

@("I can override the output file if required")
unittest
{
    auto result = parseCommandLine(["easycv", "my-fabulous-cv.json", "-o", "resume.html"]);
    assert(result.unwrap.output == "resume.html");
}

struct Options
{
    @Option("help", "h")
    @Help("Prints this help.")
    OptionFlag help;

    @Argument("file")
    @Help("Input file to be used.")
    string filename;

    @Option("output-file", "o")
    @Help("Name of the file to write the resulting HTML to. It defaults to 'cv.html'.")
    string output = "cv.html";
}

private immutable usage = usageString!Options("easycv");
private immutable help = helpString!Options;
