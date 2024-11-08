#@pulso_cp_sa#: pulso_cp_sa type rbd s_a_id
function pulso_cp_sa() {
  local type="$1"
  local rbd="$2"
  local survey_application_id="$3"
  gsutil -m cp -r "gs://survey-answers.radarescolar.cl/${type}/${rbd}/${survey_application_id}" "gs://survey-answers/${type}/${rbd}/${survey_application_id}"
}

#@pulso_cp_sa_vinapados#: pulso_cp_sa_vinapados type rbd s_a_id
function pulso_cp_sa_vinapados() {
  local type="$1"
  local rbd="$2"
  local survey_application_id="$3"
  gsutil -m cp -r "gs://survey-answers-pulso-escolar-vinapados/${type}/${rbd}/${survey_application_id}" "gs://survey-answers/${type}/${rbd}/${survey_application_id}"
}

# find . -maxdepth 5 -name ".env*" -exec grep -l keyfile.json {} \; | xargs -I {} sh -c 'cp ~/Downloads/keyfile.json $(dirname {})'

#@tmux-pulso#:[run] open pulso session
function tmux-pulso() {
  sudo systemctl restart postgresql.service

  session="pulso"
  pulso="$HOME/pulso"
  pulso_app="$HOME/pulso/pulso-app"

  # Verificar si se debe ejecutar todos los comandos
  local run_all=false
  if [ "$1" = "run" ]; then
    run_all=true
  fi

  # New session
  tmux new-session -d -s $session -n main

  # pulso
  tmux new-window -n pulso -c $pulso
  tmux split-window -h -c $pulso
  tmux select-pane -t $session:pulso.0

  # pulso-app
  tmux new-window -n pulso-app -c $pulso_app
  tmux split-window -h -c $pulso_app
  tmux split-window -v -c $pulso_app
  tmux select-pane -t $session:pulso-app.0
  tmux split-window -v -c $pulso_app
  tmux select-pane -t $session:pulso-app.0

  # Comandos para pulso-app
  if $run_all; then
    tmux send-keys -t $session:pulso-app.0 'rails c' C-m
    tmux send-keys -t $session:pulso-app.2 'rails s -b 192.168.101.1 -p 3000' C-m
    tmux send-keys -t $session:pulso-app.3 './bin/webpacker-dev-server' C-m
  fi

  # docker
  tmux new-window -n docker -c $pulso
  tmux split-window -h -c $pulso
  tmux split-window -v -c $pulso/pulso-admin-dashboard-client
  tmux select-pane -t $session:docker.0

  # Comandos para docker
  if $run_all; then
    tmux send-keys -t $session:docker.1 'docker compose up' C-m
    tmux send-keys -t $session:docker.2 'npm start' C-m
  fi

  tmux attach-session -t $session
}

#@update_env_var#:update_env_var "ENV" "****" [".env*"]
function update_env_var() {
  local var_name="$1"
  local new_value="$2"
  local file_pattern="${3:-.env*}"
  local max_depth=5

  if [ -z "$var_name" ] || [ -z "$new_value" ]; then
    echo "Uso: update_env_var 'NOMBRE_VARIABLE' 'nuevo_valor' ['patrón_archivo']"
    echo "El patrón de archivo es opcional. Por defecto es '.env*'"
    return 1
  fi

  find . -maxdepth "$max_depth" -name "$file_pattern" | xargs sed -i "s/^${var_name}=.*/${var_name}=${new_value}/"
}

#@find_env_var#:find_env_var "ENV" [".env*"]
function find_env_var() {
  local var_name="$1"
  local file_pattern="${2:-.env*}"
  local max_depth=5

  if [ -z "$var_name" ]; then
    echo "Uso: find_env_var 'NOMBRE_VARIABLE' ['patrón_archivo']"
    echo "El patrón de archivo es opcional. Por defecto es '.env*'"
    return 1
  fi

  find . -maxdepth "$max_depth" -name "$file_pattern" | xargs grep -H "^${var_name}"
}

#@restart_container#:restart_container <function-name>
function restart_container() {
  docker restart pulso-$1-1 pulso-pubsub-1
  docker restart pulso-pubsub-client-1
}

#@attach_container#:attach_container <function-name>
function attach_container() {
  docker attach --detach-keys="ctrl-x" pulso-$1-1
}

#@hotfix_pr#: hotfix_pr <reviewer>
function hotfix_pr() {
  local reviewer="$1"
  gh pr create -B master -l hotfix,production -a "$reviewer" --reviewer "$reviewer"
  gh pr create -B release -l hotfix,release -a "$reviewer" --reviewer "$reviewer"
  gh pr create -B development -l hotfix,development -a "$reviewer" --reviewer "$reviewer"
}

#@warmfix_pr#: warmfix_pr <reviewer>
function warmfix_pr() {
  local reviewer="$1"
  gh pr create -B release -l warmfix,release -a "$reviewer" --reviewer "$reviewer"
  gh pr create -B development -l warmfix,development -a "$reviewer" --reviewer "$reviewer"
}
