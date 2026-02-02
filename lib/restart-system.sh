#!/bin/bash

# ============================================
# Ubuntu Restart Function
# ============================================

restart_system() {
    print_section "System Restart"
    echo -e "${YELLOW}This will restart your system.${NC}"
    echo -e "${YELLOW}Make sure to save all your work before proceeding.${NC}"
    echo ""
    echo -n -e "${YELLOW}Are you sure you want to restart? (yes/no): ${NC}"
    read -r confirm

    if [[ "$confirm" == "yes" || "$confirm" == "y" ]]; then
        print_warning "Restarting Ubuntu in..."
        log_action "System restart initiated by user"

        for i in 5 4 3 2 1; do
            echo -e "${RED}$i...${NC}"
            sleep 1
        done

        echo -e "${GREEN}Restarting now...${NC}"
        sleep 1

        if command -v systemctl &> /dev/null; then
            sudo systemctl reboot
        elif command -v reboot &> /dev/null; then
            sudo reboot
        else
            sudo shutdown -r now
        fi
    else
        print_info "Restart cancelled by user."
        log_action "System restart cancelled by user"
    fi
}
