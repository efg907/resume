set dotenv-load

build:
    typst compile resume.typ resume.pdf \
        --input email="$EMAIL" \
        --input phone="$PHONE"