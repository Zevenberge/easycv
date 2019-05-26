module easycv.io;

import std.algorithm;
import std.conv;
import std.range.primitives;
import std.stdio;
import std.typecons;
import optional.optional;
import vibe.data.json;
import easycv.cv;

Optional!Cv loadFromFile(string filename)
{
    string contents;
    try
    {
        auto file = File(filename, "r");
        contents = file.byLineCopy(Yes.keepTerminator).inOneString;
    }
    catch(StdioException e)
    {
        writeln(e.msg);
        return no!Cv;
    }
    return parseCv(contents);
}

private Optional!Cv parseCv(string text)
{
    try
    {
        auto json = parseJson(text);
        auto cv = deserializeJson!Cv(json);
        return some(cv);
    }
    catch(JSONException e)
    {
        writeln(e.msg);
        return no!Cv;
    }
}

private string inOneString(Range)(Range range)
if(isInputRange!Range && is(ElementType!Range == string))
{
    return range.joiner.to!string;
}

@("Are my string concatenated correctly")
unittest
{
    auto input = ["Hello ", "world"];
    auto result = input.inOneString;
    assert(result == "Hello world", "The elements should have been concatenated");
}

void writeToFile(string contents, string filename)
{
    auto f = File(filename, "w");
    f.write(contents);
}