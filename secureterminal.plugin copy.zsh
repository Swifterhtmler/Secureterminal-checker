comch() {

OPTIND=1

local u=false
OPTSTRING=":u"
local showdanger=true

while getopts ${OPTSTRING} opt; do
  case ${opt} in
    u)
       u=true
       showdanger=false # does not show danger level when u option is used 
      ;;
    ?)
      echo "Invalid option: -${OPTARG}."
      exit 1
      ;;
  esac
done

shift $((OPTIND-1))


local command="$*"
local computeruser="$USER"
local newstring="${command//$computeruser/my-user-name}"


    if [[  "$command" == *"$computeruser"* && "$u" == true ]]; 
      then
        printf "$newstring"
   fi  
   


local output=$(ollama run llama3.2 "Security assessment: How dangerous is this command to system integrity? Respond with only: LOW/MEDIUM/HIGH. If you do not know it or the input looks weird answer UNKOWN Command: $command")


# local output=$(send_input)

RED='\033[0;31m'
NC='\033[0m' # No Color
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
if [[ "$showdanger" == true ]]; 
then
if [[ "$output" == "HIGH" ]]
then 
  printf "${RED}HIGH${NC}\n"
elif [[ "$output" == "LOW" ]]
then
   printf "${GREEN}LOW${NC}\n"
elif [[ "$output" == "MEDIUM" ]]
then
   printf "${YELLOW}MEDIUM${NC}\n"   
else
   printf "UNKNOWN COMMAND"       
fi
fi
}


