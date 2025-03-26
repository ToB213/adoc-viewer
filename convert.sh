/bin/bash

for file in /documents/docs/program-docs/*.adoc; do
	asciidoctor ${file}
done
