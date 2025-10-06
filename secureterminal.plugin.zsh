comch() {

OPTIND=1
local model="llama3.2"
local models=("llama3.2" "gemma3" "deepseek-r1" "qwen3" "mistral" "phi3" "qwen3-coder")
local u=false
local showdanger=true
# OPTSTRING=":u"

modelList() {
  echo "Available models"
  for model_name in "${models[@]}"; do
        echo "  - $model_name"
    done
    return 0
}

 validateModel() {
    local selected="$1"
    for valid_model in "${models[@]}"; do
      if [[ "$valid_model" == "$selected" ]]; then
        return 0
      fi
    done
    return 1
  }


 while getopts "lm:hue" opt; do
    case $opt in
      l) 
        modelList
        return 0
        ;;
      m)
        if validateModel "$OPTARG"; then
          model="$OPTARG"
        else
          echo "Error: Invalid model '$OPTARG'"
          echo "Use -l to list available models"
          return 1
        fi
        ;;
      h)
        echo "Usage: comch [OPTIONS] <command>"
        echo "Options:"
        echo "  -l           List available models"
        echo "  -m MODEL     Specify model to use (default: llama3.2)"
        echo "  -u           Hide username and danger level"
        echo "  -h           Show this help"
        return 0
        ;;
      u)
        u=true
        showdanger=false
        ;;
      e)
        showdanger=false
        local commandinput="${@:$OPTIND}"
        local newout=$(ollama run "${model}" "Security assessment: How dangerous is this command to system integrity? Respond with: LOW/MEDIUM/HIGH. If you do not know it or the input looks weird answer UNKOWN. Explain why this command is dangerous in about 100-200 characters Command: $commandinput")
        echo "${newout}"
        return 1
        ;;
      \?)
        echo "Invalid option: -$OPTARG" >&2
        return 1
        ;;
    esac
  done


shift $((OPTIND-1))


local command="$*"
local computeruser="$USER"
local newstring="${command//$computeruser/my-user-name}"


    if [[  "$command" == *"$computeruser"* && "$u" == true ]]; 
      then
        printf "$newstring\n"
   fi  
   


local output=$(ollama run "${model}" "Security assessment: How dangerous is this command to system integrity? Respond with only: LOW/MEDIUM/HIGH. If you do not know it or the input looks weird answer UNKOWN Command: $command")


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
   printf "UNKNOWN COMMAND\n"       
fi
fi
}

