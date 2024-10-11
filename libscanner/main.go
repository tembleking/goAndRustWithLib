package main

import "C"
import "fmt"

//export ScanDockerImage
func ScanDockerImage(image *C.char, secureAPIToken *C.char) {
	fmt.Printf("Scanning Docker image: %s with token: %s\n", C.GoString(image), C.GoString(secureAPIToken))
}

//export ScanIACFile
func ScanIACFile(filePath *C.char, secureAPIToken *C.char) {
	fmt.Printf("Scanning IAC file: %s with token: %s\n", C.GoString(filePath), C.GoString(secureAPIToken))
}

func main() {
}
