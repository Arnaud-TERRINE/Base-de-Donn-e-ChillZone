CREATE TABLE `type` (
  `id` int PRIMARY KEY,
  `label` varchar(255)
);

CREATE TABLE `item` (
  `id` int PRIMARY KEY,
  `label` varchar(255),
  `price` int,
  `id_type` int
);

CREATE TABLE `menu` (
  `id` int PRIMARY KEY,
  `label` varchar(255),
  `price` decimal
);

CREATE TABLE `extra` (
  `id` int PRIMARY KEY,
  `lable` varchar(255)
);

CREATE TABLE `item_menu` (
  `id` int PRIMARY KEY,
  `id_menu` int,
  `id_item` int
);

CREATE TABLE `item_extra` (
  `id` int PRIMARY KEY,
  `id_item` int,
  `id_extra` int
);

CREATE TABLE `commande` (
  `id` int PRIMARY KEY,
  `numero` int,
  `total_price` int,
  `hors_taxe` int,
  `is_complete` boolean DEFAULT null
);

CREATE TABLE `menu_commande` (
  `id` int PRIMARY KEY,
  `id_item_menu` int,
  `id_commande` int
);

CREATE TABLE `item_commande` (
  `id` int PRIMARY KEY,
  `id_item` int,
  `id_commande` int
);

ALTER TABLE `item` ADD FOREIGN KEY (`id_type`) REFERENCES `type` (`id`);

ALTER TABLE `menu` ADD FOREIGN KEY (`id`) REFERENCES `item_menu` (`id_menu`);

ALTER TABLE `item` ADD FOREIGN KEY (`id`) REFERENCES `item_menu` (`id_item`);

ALTER TABLE `item` ADD FOREIGN KEY (`id`) REFERENCES `item_extra` (`id_item`);

ALTER TABLE `extra` ADD FOREIGN KEY (`id`) REFERENCES `item_extra` (`id_extra`);

ALTER TABLE `item_menu` ADD FOREIGN KEY (`id`) REFERENCES `menu_commande` (`id_item_menu`);

ALTER TABLE `menu_commande` ADD FOREIGN KEY (`id_commande`) REFERENCES `commande` (`id`);

ALTER TABLE `item_commande` ADD FOREIGN KEY (`id_item`) REFERENCES `item` (`id`);

ALTER TABLE `item_commande` ADD FOREIGN KEY (`id_commande`) REFERENCES `commande` (`id`);

ALTER TABLE `item` ADD FOREIGN KEY (`id_type`) REFERENCES `item` (`label`);
