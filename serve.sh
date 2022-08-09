
#!/bin/sh

echo removing _site
rm -fr _site
echo using eleventy version `eleventy --version`
npx @11ty/eleventy --serve ;