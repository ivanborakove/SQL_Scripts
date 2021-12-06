CREATE FUNCTION fn_updatevalortotal()

RETURNS @tabela TABLE(

IDPEDIDO INT,

Faturado bool,

ValorTotal float)

AS 
BEGIN

	DECLARE @u_faturado bool,
		
		@u_valortotal int,
	
	DECLARE c_valortotal CURSOR FOR SELECT IDPEDIDO, Faturado, ValorTotal FROM TPedido WHERE Faturado = 0;
	
	OPEN c_valortotal
	
	FETCH NEXT FROM c_valortotal INTO @u_faturado, @u_valortotal
	
	WHILE @@FETCH_STATUS = 0
	
	BEGIN
	
	select p.idpedido, p.faturado, p.valortotal, (TPEDIDO.QUANTIDADE * TPRODUTO.PRECO) – TPEDIDO.DESCONTO) AS p.valortotalat from @tabela
END
