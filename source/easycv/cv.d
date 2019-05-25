module easycv.cv;

import std.date;
import std.typecons;

/// Type representing the structure of a
/// curriculum vitae.
class Cv
{
    /// Personal information, including name,
    /// contact info and the like.
    About about;
    /// A list of previous relevant working
    /// experience. It will be displayed
    /// in descending order (most recent first).
    Experience[] experience;
}

/// Personal information, including name,
/// contact info and the like.
class About
{
    /// Your name.
    string name;
    /// Your address. The string will be trimmed,
    /// but displayed like you put it in. The
    /// newlines will be perserved.
    string address;
    /// Your phone number.
    string phone;
    /// Your email address.
    string email;
    /// Your date of birth. It should comply to
    /// ISO 8601 standards.
    Date dateOfBirth;
    /// Your nationality.
    string nationality;
    /// Other information that you might find
    /// interesting to tell, e.g. a link to
    /// your portfolio.
    Json misc;
}

/// Describes a previous working experience relevant
/// to the job you're applying for.
class Experience
{

}