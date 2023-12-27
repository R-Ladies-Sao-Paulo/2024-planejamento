formulario <- readr::read_rds("formulario.rds") 

# Cada linha é uma resposta

contar_resposta_formulario <- function(coluna){
  formulario |> 
  dplyr::select(var = {{coluna}}) |> 
  tidyr::separate_longer_delim(var, ",") |> 
  dplyr::mutate(var = stringr::str_trim(var)) |> 
  dplyr::count(var, sort = TRUE) |> 
  dplyr::mutate(prop = scales::percent(n / nrow(formulario)))
}

tipos_de_atividade <- contar_resposta_formulario(quais_tipos_de_atividade_voce_prefere)

modalidade <- contar_resposta_formulario(em_qual_modalidade_de_eventos_voce_consegue_participar)

dia_horario <- contar_resposta_formulario(em_quais_dias_e_horarios_voce_prefere_que_as_atividades_acontecam)

temas <- contar_resposta_formulario(quais_temas_voce_gostaria_que_fossem_abordados_em_eventos)

