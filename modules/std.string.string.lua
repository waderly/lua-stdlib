-- String

require "std.string.regex"
require "std.string.table"


-- @func string.concat: Give a name to .. for strings
--   @param s, t: strings
-- returns
--   @param s_: s .. t
function string.concat (s, t)
  return s .. t
end

-- @func string.caps: Capitalise each word in a string
--   @param s: string
-- returns
--   @param s_: capitalised string
function string.caps (s)
  return (string.gsub (s, "(%w)([%w]*)",
                       function (l, ls)
                         return string.upper (l) .. ls
                       end))
end

-- @func string.chomp: Remove any final line ending from a string
--   @param s: string to process
-- returns
--   @param s_: processed string
function string.chomp (s)
  return (string.gsub (s, endOfLine .. "$", ""))
end

-- @func string.join: Turn a list of strings into a sep-separated string
--   @param sep: separator
--   @param l: list of strings to join
-- returns
--   @param s: joined up string
function string.join (sep, l)
  local s = l[1] or ""
  for i = 2, table.getn (l) do
    s = s .. sep .. l[i]
  end
  return s
end

-- @func string.escapePattern: Escape a string to be used as a pattern
--   @param s: string to process
-- returns
--   @param s_: processed string
function string.escapePattern (s)
  return (string.gsub (s, "(%W)", "%%%1"))
end

-- @param string.escapeShell: Escape a string to be used as a shell token
-- Quotes spaces, parentheses and \s
--   @param s: string to process
-- returns
--   @param s_: processed string
function string.escapeShell (s)
  return (string.gsub (s, "([ %(%)%\\])", "\\%1"))
end

-- @func string.ordinalSuffix: return the English suffix for an ordinal
--   @param n: number of the day
-- returns
--   @param s: suffix
function string.ordinalSuffix (n)
  n = math.mod (n, 100)
  local d = math.mod (n, 10)
  if d == 1 and n ~= 11 then
    return "st"
  elseif d == 2 and n ~= 12 then
    return "nd"
  elseif d == 3 and n ~= 13 then
    return "rd"
  else
    return "th"
  end
end
