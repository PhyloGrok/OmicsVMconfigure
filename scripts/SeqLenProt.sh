awk '/^>/{if (l!="") print l; print; l=0; next}{l+=length($0)}END{print l}' protein.faa > proteincount.txt
