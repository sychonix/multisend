#!/bin/bash

# Path ke Node.js script Anda
SCRIPT="transfer.js"

# Fungsi untuk menjalankan script
run_script() {
    node $SCRIPT
}

# Loop untuk menjalankan script dan melakukan retry jika terjadi error
while true; do
    run_script
    exit_code=$?
    if [ $exit_code -eq 0 ]; then
        echo "Script selesai dengan sukses."
        break
    else
        echo "Script mengalami error dengan exit code $exit_code. Restarting..."
        sleep 1 # Menunggu 1 detik sebelum restart
    fi
done
