WITH membros_stark AS (
    SELECT p.ID AS id_personagem,
           p.Nome AS nome_personagem
    FROM Personagem p
    JOIN Pertencimento pe ON pe.ID_Personagem = p.ID
    JOIN Casa c ON c.Nome = pe.Nome_Casa
    WHERE c.Nome = 'House Stark'
),
participacoes_stark AS (
    SELECT ms.id_personagem,
           ms.nome_personagem,
           b.Nome AS nome_batalha,
           g.Nome AS nome_guerra
    FROM membros_stark ms
    LEFT JOIN Luta_em le ON le.ID_Personagem = ms.id_personagem
    LEFT JOIN Batalha b ON b.Nome = le.Nome_Batalha
    LEFT JOIN Guerra g ON g.Nome = b.Nome_Guerra
),
assassinatos_stark AS (
    SELECT ms.id_personagem,
           ms.nome_personagem,
           p_assassinado.Nome AS personagem_assassinado,
           a.Nome AS arma_utilizada,
           a_assassino.Causa_Morte AS descricao_morte
    FROM membros_stark ms
    LEFT JOIN Assassinato a_assassino ON a_assassino.ID_Assassino = ms.id_personagem
    LEFT JOIN Personagem p_assassinado ON p_assassinado.ID = a_assassino.ID_Assassinado
    LEFT JOIN Arma a ON a.Nome = a_assassino.Nome_Arma
)
SELECT
    ps.nome_personagem AS nome,
    ps.nome_batalha AS batalha,
    ps.nome_guerra AS guerra,
    asn.personagem_assassinado AS nome_personagem_assassinado,
    asn.arma_utilizada,
    asn.descricao_morte
FROM participacoes_stark ps
LEFT JOIN assassinatos_stark asn
    ON asn.id_personagem = ps.id_personagem
ORDER BY ps.nome_personagem, ps.nome_batalha, asn.personagem_assassinado;
