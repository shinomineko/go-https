package main

import (
	"fmt"
	"log"
	"net/http"

	"github.com/rocketlaunchr/https-go"
)

func main() {
	http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		w.WriteHeader(http.StatusOK)
		fmt.Fprintf(w, "hello https")
	})

	httpServer, _ := https.Server("8443", https.GenerateOptions{Host: "localhost"})
	log.Fatal(httpServer.ListenAndServeTLS("", ""))
}
