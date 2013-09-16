using System.Text.RegularExpressions;
using Microsoft.SqlServer.Server;

namespace SqlExtensions
{
    public partial class RegexExtensions
    {
        /// <summary>
        /// Indicates whether the specified regular expression finds a match in the specified input string.
        /// </summary>
        /// <param name="input">The string to search for a match.</param>
        /// <param name="pattern">The regular expression pattern to match.</param>
        /// <returns>true if the regular expression finds a match; otherwise, false.</returns>
        [SqlFunction]
        public static bool IsMatch(string input, string pattern)
        {
            return Regex.IsMatch(input, pattern);
        }

        [SqlFunction]
        public static string Replace(string input, string pattern, string replacement)
        {
            return Regex.Replace(input, pattern, replacement);
        }
    }
}