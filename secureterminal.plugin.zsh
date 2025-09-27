comch() {
local command="$*"

local output =$(ollama run llama3.2 "Security assessment: How dangerous is this command to system integrity? Respond with only: LOW/MEDIUM/HIGH. If you do not know it or the input looks weird answer UNKOWN Command: $command")

# local output=$(send_input)

RED='\033[0;31m'
NC='\033[0m' # No Color
GREEN='\033[0;32m'
YELLOW'\033[0;33m'

if [[ "$output" == "HIGH" ]]
then 
 echo -e "${RED}HIGH{NC}"
elif [[ "$output" == "LOW" ]]
then
   echo -e "${GREEN}LOW${NC}"
elif [[ "$output" == "MEDIUM" ]]
then
   echo -e "${YELLOW}MEDIUM${NC}"   
else
   echo "UNKNOWN COMMAND"       
fi
}

