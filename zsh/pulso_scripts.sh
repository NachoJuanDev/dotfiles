#@pulso_cp_sa#: gsutil -m cp -r gs://survey-answers.radarescolar.cl/{type}/{rbd}/{survey_application_id} gs://survey-answers/{type}/{rbd}/{survey_application_id}
function pulso_cp_sa() {
  local type="$1"
  local rbd="$2"
  local survey_application_id="$3"
  gsutil -m cp -r "gs://survey-answers.radarescolar.cl/${type}/${rbd}/${survey_application_id}" "gs://survey-answers/${type}/${rbd}/${survey_application_id}"
}
