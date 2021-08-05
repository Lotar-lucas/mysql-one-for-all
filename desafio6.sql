CREATE VIEW faturamento_atual AS
SELECT
  MIN(valor_plano) as faturamento_minimo,
  MAX(valor_plano) as faturamento_maximo,
  ROUND(SUM(valor_plano) / COUNT(nome_usuario),2) as faturamento_medio,
  SUM(p.valor_plano) as faturamento_total
FROM plano as p
INNER JOIN  usuario as u
ON p.plano_id = u.plano_id;
