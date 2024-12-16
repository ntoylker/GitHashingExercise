#!/bin/bash

# Έλεγχος αν δόθηκε είσοδος
if [ -z "$1" ]; then
  echo "Παρακαλώ δώστε έναν ακέραιο αριθμό ως είσοδο."
  exit 1
fi

# Αποθήκευση της εισόδου
input="$1"

# Υπολογισμός του SHA-256 hash
hash=$(echo -n "$input" | sha256sum | awk '{print $1}')

# Εμφάνιση του αποτελέσματος
echo "Το SHA-256 hash του $input είναι:"
echo "$hash"
