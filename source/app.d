import std.stdio;
import optional.optional;
import easycv.html;
import easycv.io;
import easycv.opts;

int main(string[] args)
{
	auto options = parseCommandLine(args);
	if(options == none) return 0;
	writeln("Loading json from file.");
	auto cv = loadFromFile(options.unwrap.filename);
	if(cv == none) return 1;
	writeln("Converting the CV to html.");
	string style = loadCss;
	string html = convertToHtml(cv.unwrap, style);
	writeln("Writing the html to file.");
	html.writeToFile(options.unwrap.output);
	writeln("Done.");
	return 0;
}
