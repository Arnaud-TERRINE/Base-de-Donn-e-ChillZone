CREATE TABLE `type` (
  `id` INTEGER PRIMARY KEY AUTOINCREMENT,
  `label` varchar(255)
);

CREATE TABLE `item` (
  `id` INTEGER PRIMARY KEY AUTOINCREMENT,
  `label` varchar(255),
  `price` INTEGER,
  `id_type` INTEGER ,
  FOREIGN KEY (`id_type`) REFERENCES `type` (`id`)
);

CREATE TABLE `menu` (
  `id` INTEGER PRIMARY KEY AUTOINCREMENT,
  `label` varchar(255),
  `price` decimal
);

CREATE TABLE `extra` (
  `id` INTEGER PRIMARY KEY AUTOINCREMENT,
  `lable` varchar(255)
);

CREATE TABLE `item_menu` (
  `id` INTEGER PRIMARY KEY AUTOINCREMENT,
  `id_menu` INTEGER, 
  `id_item` INTEGER,
  FOREIGN KEY (`id_menu`) REFERENCES `menu` (`id`),
  FOREIGN KEY (`id_item`) REFERENCES `item` (`id`)
);

CREATE TABLE `item_extra` (
  `id` INTEGER PRIMARY KEY AUTOINCREMENT,
  `id_item` INTEGER,
  `id_extra` INTEGER,
  FOREIGN KEY (`id_item`) REFERENCES `item` (`id`),
  FOREIGN KEY (`id_extra`) REFERENCES `extra` (`id`)
);

CREATE TABLE `commande` (
  `id` INTEGER PRIMARY KEY AUTOINCREMENT,
  `numero` INTEGER,
  `total_price` INTEGER,
  `hors_taxe` INTEGER,
  `is_complete` boolean 
);

CREATE TABLE `menu_commande` (
  `id` INTEGER PRIMARY KEY AUTOINCREMENT,
  `id_menu` INTEGER,
  `id_commande` INTEGER,
  FOREIGN KEY (`id_menu`) REFERENCES `menu` (`id`),
  FOREIGN KEY (`id_commande`) REFERENCES `commande` (`id`)
);

CREATE TABLE `item_commande` (
  `id` INTEGER PRIMARY KEY AUTOINCREMENT,
  `id_item` INTEGER,
  `id_commande` INTEGER,
  FOREIGN KEY (`id_item`) REFERENCES `item` (`id`),
  FOREIGN KEY (`id_commande`) REFERENCES `commande` (`id`)
);
