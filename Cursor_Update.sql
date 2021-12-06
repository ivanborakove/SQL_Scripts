

	DECLARE @ValorTotal2 decimal(18,2)

	DECLARE c_updatevalortotal CURSOR FOR SELECT valortotal from TPedido

	OPEN c_updatevalortotal

	FETCH NEXT FROM c_updatevalortotal INTO @ValorTotal2

	WHILE @@FETCH_STATUS = 0

	BEGIN

		MERGE INTO TPedido t1 USING
		
		(SELECT IdPedido, (TPEDIDO.Quantidade * TProduto.Preco) - TPedido.Desconto 
		
		AS ValorTotal2 FROM TPedido 			
		
		INNER JOIN TProduto 
		
		ON TPedido.IDProduto = TProduto.IDProduto WHERE Faturado = 0) t2

		ON t1.IdPedido = t2.IdPedido

		WHEN MATCHED THEN UPDATE SET t1.ValorTotal = t2.ValorTotal2;

		FETCH NEXT FROM c_updatevalortotal INTO @ValorTotal2

	END

	CLOSE c_updatevalortotal;

	DEALLOCATE c_updatevalortotal;

	RETURN;
