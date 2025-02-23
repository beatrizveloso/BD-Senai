USE e_games;

Select nmCliente, telefone, email, cpf, dtnasc
from cliente;

Select dtPedido, valorTotalPd, metodoPag
from pedido;

Select preçoUnid, preçoTotalItem, Qntd
from item_pedido;

Select nmdoJogo, sinopse, preco, qntdEstoque
from produto;

Select distinct nmcategoria, descricao
from categoria;

Select nmFornecedor, cnpj, telefone, email
from fornecedor;

Select precoUnit, prazoEntrega
from fornproduto;

Select dtPagamento, MetodoPag, ValorPag, StatusPag
from pagamento;

SELECT*
FROM produto
ORDER BY nmdoJogo ASC;

SELECT*
FROM fornecedor
ORDER BY nmFornecedor ASC;

SELECT*
FROM Cliente
ORDER BY nmCliente ASC;

SELECT sum(valorTotalPd) AS "Vendas"
FROM pedido;

SELECT MIN(preco) AS "Menor Preço"
FROM produto;

SELECT max(preco) AS "Maior Preço"
FROM produto;