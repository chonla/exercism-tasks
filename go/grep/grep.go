/*
Packag grep provides a method to do line matching operation with various options.
*/
package grep

import (
	"fmt"
	"io/ioutil"
	"regexp"
	"strings"
)

// Search returns result from line matching operation to given files.
// Possible flags are listed below and can be multiple used.
// - `-n` Print the line numbers of each matching line.
// - `-l` Print only the names of files that contain at least one matching line.
// - `-i` Match line using a case-insensitive comparison.
// - `-v` Invert the program -- collect all lines that fail to match the pattern.
// - `-x` Only match entire lines, instead of lines that contain a match.
func Search(pattern string, flags, files []string) []string {
	output := []string{}
	var lineNumFlag bool
	var caseInsensitiveFlag bool
	var fileNameFlag bool
	var entireLineFlag bool
	var invertFlag bool
	var multipleFileFlag bool

	for _, flag := range flags {
		switch flag {
		case "-n":
			lineNumFlag = true
		case "-i":
			caseInsensitiveFlag = true
		case "-l":
			fileNameFlag = true
		case "-x":
			entireLineFlag = true
		case "-v":
			invertFlag = true
		}
	}

	if len(files) > 1 {
		multipleFileFlag = true
	}

	if entireLineFlag {
		pattern = fmt.Sprintf("^%s$", pattern)
	}

	if caseInsensitiveFlag {
		pattern = fmt.Sprintf("(?i)%s", pattern)
	}

	re := regexp.MustCompile(pattern)
	for _, file := range files {
		b, _ := ioutil.ReadFile(file)
		content := strings.TrimRight(string(b), "\n")
		if fileNameFlag {
			if re.MatchString(content) != invertFlag {
				output = append(output, file)
			}
		} else {
			lines := strings.Split(content, "\n")
			for lineNum, line := range lines {
				if re.MatchString(line) != invertFlag {
					if lineNumFlag {
						line = fmt.Sprintf("%d:%s", lineNum+1, line)
					}
					if multipleFileFlag {
						line = fmt.Sprintf("%s:%s", file, line)
					}
					output = append(output, line)
				}
			}
		}
	}
	return output
}
