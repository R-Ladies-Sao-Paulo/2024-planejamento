formulario <- readr::read_rds("formulario.rds") 

# Cada linha é uma resposta

contar_resposta_formulario <- function(coluna){
  formulario |> 
  dplyr::select(var = {{coluna}}) |> 
  tidyr::separate_longer_delim(var, ",") |> 
  tidyr::drop_na(var) |> 
  dplyr::filter(var != "") |> 
  dplyr::mutate(var = stringr::str_trim(var)) |> 
  dplyr::count(var, sort = TRUE) |> 
  dplyr::mutate(prop = scales::percent(n / nrow(formulario)))
}

tipos_de_atividade <- contar_resposta_formulario(quais_tipos_de_atividade_voce_prefere)

modalidade <- contar_resposta_formulario(em_qual_modalidade_de_eventos_voce_consegue_participar)

dia_horario <- contar_resposta_formulario(dias_horarios)

temas <- contar_resposta_formulario(temas)

# Exportando
tipos_de_atividade |> 
  readr::write_rds("tipos_de_atividade.rds")

modalidade |>
  readr::write_rds("modalidade.rds")

dia_horario |>
  readr::write_rds("dia_horario.rds")

temas |>
  readr::write_rds("temas.rds")

