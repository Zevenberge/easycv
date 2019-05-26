module easycv.cv;

import std.datetime;
import std.typecons;
import vibe.data.json;

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
    /// Optionally: A list of voluntary duties that you want
    /// to share with the world.
    Nullable!(Experience[]) voluntary;
    /// What educations have been followed.
    Education[] education;
    /// A non-exhaustive list of possibly relevant skills.
    Skill[] skills;
    /// What languages you are speaking.
    Language[] languages;
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
    /// Optionally: Other information that you might find
    /// interesting to tell, e.g. a link to
    /// your portfolio.
    Nullable!Json misc;
}

/// Describes a previous working experience relevant
/// to the job you're applying for.
class Experience
{
    /// When the job was started.
    When from;
    /// Optionally: When the job ended. If the job continues until the
    /// present, leave it blank.
    Nullable!When to;
    /// Where the experience took place. E.g. your employer,
    /// your sports club or your university.
    string organisation;
    /// Optionally: Describes the context the experience was in. E.g.
    /// 'internship' or 'master thesis'. Leave blank if
    /// the context is not applicable.
    Nullable!string context;
    /// Short decription on what the experience entailed. E.g.
    /// 'Simulating thermal flow in fluids at small length scales
    /// using Fortran'.
    string description;
    /// Optionally: Lists meaningful parts of this experience that are worth
    /// mentioning, but not big enough to become a top-level
    /// experience on their own
    Nullable!(Task[]) tasks;
}

/// Describes a meaningful part of an experience, worth mentioning
/// on its own.
class Task
{
    /// When the job was started.
    When from;
    /// Optionally: When the job ended. If the job continues until the
    /// present, leave it blank.
    Nullable!When to;
    /// Short decription on what the experience entailed. E.g.
    /// 'Simulating thermal flow in fluids at small length scales
    /// using Fortran'.
    string description;
}

/// Describes an education that was followed.
class Education
{
    /// When the education was started.
    When from;
    /// Optionally: When the education was finished. 
    /// If the education continues until the
    /// present, leave it blank.
    Nullable!When to;
    /// The organisation you were enrolled in.
    string organisation;
    /// Name of the education and rank. E.g.
    /// 'Applied physics BSc'.
    string description;
}

/// Describes a set of skills that are or can be
/// useful for the job you're applying for.
class Skill
{
    /// A global description of what kind of skills you're
    /// listing. E.g. 'Programming' or 'Development process'.
    string category;
    /// An exhaustive list (longer is better, right?) of skills
    /// that fall in the given category. E.g. programming languages
    /// or development methologies.
    string[] skills;
}

/// Describes a known language and to what degree.
class Language
{
    /// The actual language. E.g. 'Japanese'.
    string language;
    /// To what rate are you manage to survive in a country?
    /// E.g. 'native' or 'elementary'.
    string proficiency;
}

/// Specifies a point in time at which an event occured.
/// For example, starting a job at August 2015.
struct When
{
    /// Optionally: The month the event occured.
    Nullable!Month month;
    /// The year the event occured.
    int year;
}

/// Months of the year.
enum Month
{
    January,
    February,
    March,
    April,
    May,
    June,
    July,
    August,
    September,
    October,
    November,
    December
}