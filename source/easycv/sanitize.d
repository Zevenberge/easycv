module easycv.sanitize;

import std.conv;
import std.uni;
import vibe.data.json;

string cleanLabel(string name)
{
    // TODO: split on camelCase.
    return name[0].toUpper.to!string ~ name[1 .. $];
}

@("The first letter should be capitalised")
unittest
{
    auto clean = cleanLabel("portfolio");
    assert(clean == "Portfolio");
}

string cleanJson(Json value)
{
    return value.get!string;
}