package vicigo

import (
	"fmt"
	"os"

)

func main() {
	if err := run(os.Args); err != nil {
		fmt.Fprintf(os.Stderr, "error: %v\n", err)
		os.Exit(1)
	}
}

func run(args []string) error {
	fmt.Println("args", args)
	return nil
}
