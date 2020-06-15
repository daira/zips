#!/bin/sh

if ! ( ( [ "x$1" = "x--rst" ] && [ $# -eq 2 ] ) || ( [ "x$1" = "x--md" ] && [ $# -eq 3 ] ) ); then
    echo "Usage: edithtml.sh --rst <htmlfile>"
    echo "   or: edithtml.sh --md <htmlfile> <title>"
    exit
fi

if ! [ -f "$2" ]; then
    echo File not found: "$2"
    exit
fi

if [ "x$1" = "x--rst" ]; then
    sed -i.sedbak 's|</head>|<meta name="viewport" content="width=device-width, initial-scale=1"><link rel="stylesheet" href="css/style.css"></head>|' $2
    sed -i.sedbak 's|http://cdn.mathjax.org/mathjax/latest/MathJax.js|https://cdn.jsdelivr.net/npm/mathjax@3/es5/tex-mml-chtml.js|' $2
else
    cat - $2 >$2.prefix <<EOF
<!DOCTYPE html>
<html>
<head>
    <title>$3</title>
    <meta charset="utf-8" />
    <script src="https://cdn.jsdelivr.net/npm/mathjax@3/es5/tex-mml-chtml.js?config=TeX-AMS-MML_HTMLorMML"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1"><link rel="stylesheet" href="css/style.css">
</head>
<body>
EOF
    cat $2.prefix - >$2 <<EOF
</body>
</html>
EOF
    rm -f $2.prefix
fi

sed -i.sedbak 's|<a href="\([^":]*\).rst">|<a href="\1">|g' $2

perl -i.sedbak -p0e 's|<section id="([^"]*)">\s*.?\s*<h([1-9])>([^<]*(?:<code>[^<]*</code>[^<]*)?)</h([1-9])>|<section id="\1"><h\2><span class="section-heading">\3</span><span class="section-anchor"> <a href="#\1"><img width="24" height="24" src="assets/images/section-anchor.png" alt=""></a></span></h\4>|g' "$2"

rm -f *.sedbak
