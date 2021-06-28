# use in safe directory
alias journal-encrypt='gpg --cipher-algo AES256 --symmetric journal.txt && gpg --version > gpg_version'
alias journal-decrypt='gpg journal.txt.gpg'
alias journal-date='date +"%l:%M %p, %B %d, %Y"'
