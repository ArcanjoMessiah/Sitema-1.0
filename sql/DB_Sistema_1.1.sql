-- MySQL Script generated by MySQL Workbench
-- Wed Sep  9 10:06:12 2020
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema db_sistema1.1
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema db_sistema1.1
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `db_sistema1.1` DEFAULT CHARACTER SET utf8mb4 ;
USE `db_sistema1.1` ;

-- -----------------------------------------------------
-- Table `db_sistema1.1`.`perfil`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_sistema1.1`.`perfil` (
  `idperfil` INT(11) NOT NULL AUTO_INCREMENT,
  `perfil` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idperfil`))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `db_sistema1.1`.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_sistema1.1`.`usuario` (
  `idusuario` INT(11) NOT NULL AUTO_INCREMENT,
  `usuario` VARCHAR(45) NOT NULL,
  `senha` VARCHAR(45) NOT NULL,
  `perfil_idperfil` INT(11) NOT NULL,
  `sexo` INT(2) NOT NULL,
  `email` VARCHAR(100) NOT NULL,
  `arquivo` BLOB NULL DEFAULT NULL,
  `telefone` VARCHAR(45) NOT NULL,
  `cpf` INT(15) NULL DEFAULT NULL,
  `rg` INT(15) NULL DEFAULT NULL,
  `datanascimento` DATE NULL DEFAULT NULL,
  `endereco` VARCHAR(200) NULL DEFAULT NULL,
  `nome` VARCHAR(50) NULL DEFAULT NULL,
  `datacadastro` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP(),
  PRIMARY KEY (`idusuario`),
  INDEX `perfil_idperfil` (`perfil_idperfil` ASC),
  INDEX `endereco` (`endereco` ASC),
  CONSTRAINT `fk_perfil_idperfil`
    FOREIGN KEY (`perfil_idperfil`)
    REFERENCES `db_sistema1.1`.`perfil` (`idperfil`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 37
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `db_sistema1.1`.`compra`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_sistema1.1`.`compra` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `total` DOUBLE(5,2) NULL DEFAULT NULL,
  `usuario_idusuario` INT(11) NOT NULL,
  `datapedido` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP(),
  `pagamento` VARCHAR(50) NULL DEFAULT NULL,
  `entrega` VARCHAR(45) NULL DEFAULT NULL,
  `enderecoentrega` VARCHAR(200) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_carrinho_usuario1_idx` (`usuario_idusuario` ASC),
  INDEX `fk_endereco_usuario` USING BTREE (`enderecoentrega`),
  CONSTRAINT `fk_carrinho_usuario1`
    FOREIGN KEY (`usuario_idusuario`)
    REFERENCES `db_sistema1.1`.`usuario` (`idusuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 44
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `db_sistema1.1`.`produto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_sistema1.1`.`produto` (
  `idproduto` INT(15) NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `categoria` VARCHAR(50) NULL DEFAULT NULL,
  `quantidade` INT(15) NULL DEFAULT NULL,
  `descricao` VARCHAR(300) NULL DEFAULT NULL,
  `datavalidade` DATE NULL DEFAULT NULL,
  `preco` DOUBLE(5,2) NOT NULL,
  `tipo` VARCHAR(20) NULL DEFAULT NULL,
  `datacadastro` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP(),
  PRIMARY KEY (`idproduto`))
ENGINE = InnoDB
AUTO_INCREMENT = 21
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `db_sistema1.1`.`compra_has_produto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_sistema1.1`.`compra_has_produto` (
  `compra_idPedido` INT(11) NOT NULL,
  `produto_idproduto` INT(11) NOT NULL,
  `quantidade` INT(11) NOT NULL,
  PRIMARY KEY (`compra_idPedido`, `produto_idproduto`),
  INDEX `fk_compra_has_produto_produto1_idx` (`produto_idproduto` ASC),
  INDEX `fk_compra_has_produto_compra1_idx` (`compra_idPedido` ASC),
  CONSTRAINT `fk_compra_has_produto_compra1`
    FOREIGN KEY (`compra_idPedido`)
    REFERENCES `db_sistema1.1`.`compra` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_compra_has_produto_produto1`
    FOREIGN KEY (`produto_idproduto`)
    REFERENCES `db_sistema1.1`.`produto` (`idproduto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;



INSERT INTO `perfil` (`idperfil`, `perfil`) VALUES
(1, 'Administrador'),
(2, 'Usuário'),
(3, 'Cliente');


INSERT INTO `usuario` (`idusuario`, `usuario`, `senha`, `perfil_idperfil`, `sexo`, `email`, `arquivo`, `telefone`, `cpf`, `rg`, `datanascimento`, `endereco`, `nome`, `datacadastro`) VALUES
(2, 'vanessa', '202cb962ac59075b964b07152d234b70', 2, 2, 'test@testeee', NULL, '09999999999', 34534, 777, '2020-08-10', '', NULL, '2020-09-05 14:36:47'),
(3, 'Douglas', '202cb962ac59075b964b07152d234b70', 1, 1, '', '', '0', NULL, NULL, NULL, NULL, NULL, '2020-09-05 14:36:47'),
(12, 'Lucas', 'd9b1d7db4cd6e70935368a1efb10e377', 1, 1, 'test@teste', NULL, '0', 0, 0, '1990-05-14', 'ccddddddd', NULL, '2020-09-05 14:36:47'),
(21, 'Davi', '202cb962ac59075b964b07152d234b70', 3, 1, 'teste@test', NULL, '+5561981845954', 34534, 777, '2020-07-29', 'Quadra 22 Conjunto E Casa', NULL, '2020-09-05 14:36:47'),
(33, 'Bia', 'd9b1d7db4cd6e70935368a1efb10e377', 2, 2, '1@2.com', NULL, '888888888', 333333, 2222, '2020-08-20', 'casa', NULL, '2020-09-05 14:36:47'),
(34, 'Ruan', 'd9b1d7db4cd6e70935368a1efb10e377', 1, 1, 'r@rr', NULL, '9999999999', 0, 999999999, '2020-08-05', 'casa dele', NULL, '2020-09-05 14:36:47'),
(35, 'Ruan', 'd9b1d7db4cd6e70935368a1efb10e377', 3, 1, 'ddd@fff', NULL, '44444444', 4444444, 222222222, '2020-06-16', 'xxxxxxxxxxxxxxxx', NULL, '2020-09-05 14:36:47'),
(36, 'Cliente teste', '202cb962ac59075b964b07152d234b70', 3, 2, 'teste@test', NULL, '61981845954', 0, 23232, '2020-02-16', 'Quadra 22 Conjunto E Casa', NULL, '2020-09-05 22:27:20');



--
-- Extraindo dados da tabela `compra`
--

INSERT INTO `compra` (`id`, `total`, `usuario_idusuario`, `datapedido`, `pagamento`, `entrega`, `enderecoentrega`) VALUES
(18, 20.97, 36, '2020-09-06 02:39:47', NULL, 'EM SEPARAÇÃO', ''),
(21, 13.98, 36, '2020-09-06 02:43:20', NULL, 'EM SEPARAÇÃO', ''),
(23, 20.97, 36, '2020-09-06 02:44:50', NULL, 'EM SEPARAÇÃO', ''),
(24, 20.97, 36, '2020-09-06 02:45:45', NULL, 'EM SEPARAÇÃO', ''),
(28, 18.99, 36, '2020-09-06 02:52:29', NULL, 'EM SEPARAÇÃO', ''),
(29, 37.98, 36, '2020-09-06 02:53:30', NULL, 'EM SEPARAÇÃO', ''),
(30, 37.98, 36, '2020-09-06 03:10:06', NULL, 'EM SEPARAÇÃO', ''),
(34, 37.98, 36, '2020-09-06 03:17:02', NULL, 'EM SEPARAÇÃO', ''),
(38, 37.98, 36, '2020-09-06 03:22:36', NULL, 'EM SEPARAÇÃO', ''),
(41, 24.00, 21, '2020-09-06 23:50:25', NULL, 'EM SEPARAÇÃO', NULL),
(42, 28.49, 21, '2020-09-06 23:51:10', NULL, 'EM SEPARAÇÃO', NULL),
(43, 11.48, 21, '2020-09-06 23:54:54', NULL, 'EM SEPARAÇÃO', NULL);


INSERT INTO `produto` (`idproduto`, `nome`, `categoria`, `quantidade`, `descricao`, `datavalidade`, `preco`, `tipo`, `datacadastro`) VALUES
(18, 'Café do Sítio', 'alimentos', 150, 'Café do sitio 500g café tipo A jajfjasofjdasjdaspio', '2020-12-26', 6.99, 'perecivel', '2020-09-06 01:53:48'),
(19, 'Arroz', 'alimentos', 200, 'arroz tio jorge 5kg', '2021-01-08', 12.00, 'perecivel', '2020-09-06 02:51:00'),
(20, 'Feijão ', 'alimentos', 200, 'feijão Ki-caldo 1 kg', '2021-03-06', 4.49, 'perecivel', '2020-09-06 02:51:52');




INSERT INTO `compra_has_produto` (`compra_idPedido`, `produto_idproduto`, `quantidade`) VALUES
(30, 18, 2),
(30, 19, 2),
(38, 18, 2),
(38, 19, 2),
(29, 18, 2),
(29, 19, 2),
(21, 18, 2),
(21, 19, 2),
(41, 19, 2),
(42, 19, 2),
(42, 20, 1),
(43, 18, 1),
(43, 20, 1);
