#!/bin/bash

# Main menu loop
while true; do
    # Prompt for target IP or website
    echo "Enter IP address/website to scan (or type 'exit' to quit):"
    read target

    # Exit condition
    if [ "$target" == "exit" ]; then
        echo "Exiting the script."
        break
    fi

    export ip="$target"  # Export target as an environment variable if needed

    # Display scan options
    echo -e "\nChoose scan type:"
    echo "1. Stealth Scan (-sS)"
    echo "2. Service Version Detection (-sV)"
    echo "3. OS Detection (-O)"
    echo "4. Ping Sweep (-sn)"
    echo "5. Aggressive Scan (-A)"
    echo "6. Detect Common Vulnerabilities (using --script vuln)"
    echo "7. UDP Scan (-sU)"
    echo "8. Scan for Top 1000 Ports (default scan)"
    echo "9. Exit"

    read -p "Enter your choice (1-9): " choice

    # Exit option
    if [ "$choice" -eq 9 ]; then
        echo "Exiting the script."
        break
    fi

    # Ask if user wants to save output
    read -p "Do you want to save the output to a file? (yes/no): " save_output
    if [[ "$save_output" == "yes" ]]; then
        read -p "Enter the file name to save the output (e.g., scan_results.txt): " output_file
        save_path="/root/Desktop/scanresults/$output_file"
        mkdir -p "/root/Desktop/scanresults"  # Create the directory if it doesn't exist
    fi

    # Set up the scan command based on user choice
    scan_command=""
    if [ "$choice" -eq 1 ]; then
        scan_command="nmap -sS $target"            # Stealth scan
    elif [ "$choice" -eq 2 ]; then
        scan_command="nmap -sV $target"            # Service version detection
    elif [ "$choice" -eq 3 ]; then
        scan_command="nmap -O $target"             # OS detection
    elif [ "$choice" -eq 4 ]; then
        scan_command="nmap -sn $target"            # Ping sweep
    elif [ "$choice" -eq 5 ]; then
        scan_command="nmap -A $target"             # Aggressive scan
    elif [ "$choice" -eq 6 ]; then
        scan_command="nmap --script vuln $target"  # Common vulnerability detection
    elif [ "$choice" -eq 7 ]; then
        scan_command="nmap -sU $target"            # UDP scan
    elif [ "$choice" -eq 8 ]; then
        scan_command="nmap $target"                # Default scan for top 1000 ports
    else
        echo "Enter a valid choice."
        continue
    fi

    # Run the scan command and optionally save output to a file
    if [[ "$save_output" == "yes" && -n "$output_file" ]]; then
        $scan_command | tee "$save_path"
        echo "Scan results saved to $save_path."
    else
        $scan_command
    fi

    # Get the width of the terminal
    terminal_width=$(tput cols)

    # Function to print a responsive banner
    print_banner() {
        local char="$1"
        printf "%-${terminal_width}s\n" | tr ' ' "$char"
    }

    # Print the completion banner
    print_banner "-"
    echo "$(printf "%*s" $((($terminal_width + 20) / 2)) "Scan has been completed")"
    print_banner "-"
done

