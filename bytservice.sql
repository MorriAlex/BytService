-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Хост: MySQL-8.4:3306
-- Время создания: Дек 25 2025 г., 13:13
-- Версия сервера: 8.4.6
-- Версия PHP: 8.4.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `bytservice`
--

-- --------------------------------------------------------

--
-- Структура таблицы `comments`
--

CREATE TABLE `comments` (
  `commentID` int NOT NULL,
  `message` text,
  `masterID` int DEFAULT NULL,
  `requestID` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `comments`
--

INSERT INTO `comments` (`commentID`, `message`, `masterID`, `requestID`) VALUES
(1, 'Интересная поломка', 2, 1),
(2, 'Очень странно, будем разбираться!', 3, 2),
(3, 'Скорее всего потребуется мотор обдува!', 2, 7),
(4, 'Интересная проблема', 2, 1),
(5, 'Очень странно, будем разбираться!', 3, 6);

-- --------------------------------------------------------

--
-- Структура таблицы `repairs`
--

CREATE TABLE `repairs` (
  `requestID` int NOT NULL,
  `startDate` date DEFAULT NULL,
  `homeTechType` varchar(50) DEFAULT NULL,
  `homeTechModel` varchar(100) DEFAULT NULL,
  `problemDescryption` text,
  `requestStatus` varchar(50) DEFAULT NULL,
  `completionDate` date DEFAULT NULL,
  `repairParts` text,
  `masterID` int DEFAULT NULL,
  `clientID` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `repairs`
--

INSERT INTO `repairs` (`requestID`, `startDate`, `homeTechType`, `homeTechModel`, `problemDescryption`, `requestStatus`, `completionDate`, `repairParts`, `masterID`, `clientID`) VALUES
(1, '2023-06-06', 'Фен', 'Ладомир ТА112 белый', 'Перестал работать', 'В процессе ремонта', NULL, NULL, 2, 7),
(2, '2023-05-05', 'Тостер', 'Redmond RT-437 черный', 'Перестал работать', 'В процессе ремонта', NULL, NULL, 3, 7),
(3, '2022-07-07', 'Холодильник', 'Indesit DS 316 W белый', 'Не морозит одна из камер холодильника', 'Готова к выдаче', '2023-01-01', NULL, 2, 8),
(4, '2023-08-02', 'Стиральная машина', 'DEXP WM-F610NTMA/WW белый', 'Перестали работать многие режимы стирки', 'Новая заявка', NULL, NULL, 8, NULL),
(5, '2023-08-02', 'Мультиварка', 'Redmond RMC-M95 черный', 'Перестала включаться', 'Новая заявка', NULL, NULL, 9, NULL),
(6, '2023-08-02', 'Фен', 'Ладомир ТА113 чёрный', 'Перестал работать', 'Готова к выдаче', '2023-08-03', NULL, 2, 7),
(7, '2023-07-09', 'Холодильник', 'Indesit DS 314 W серый', 'Гудит, но не замораживает', 'Готова к выдаче', '2023-08-03', 'Мотор обдува морозильной камеры холодильника', 2, 8);

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `userID` int NOT NULL,
  `fio` varchar(100) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `login` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`userID`, `fio`, `phone`, `login`, `password`, `type`) VALUES
(1, 'Трубин Никита Юрьевич', '89210563128', 'kasoo', 'root', 'Менеджер'),
(2, 'Мурашов Андрей Юрьевич', '89535078985', 'murashov123', 'qwerty', 'Мастер'),
(3, 'Степанов Андрей Викторович', '89210673849', 'test1', 'test1', 'Мастер'),
(4, 'Перина Анастасия Денисовна', '89990563748', 'perinaAD', '250519', 'Оператор'),
(5, 'Мажитова Ксения Сергеевна', '89994563847', 'krutiha1234567', '1234567890', 'Оператор'),
(6, 'Семенова Ясмина Марковна', '89994563847', 'login1', 'pass1', 'Мастер'),
(7, 'Баранова Эмилия Марковна', '89994563841', 'login2', 'pass2', 'Заказчик'),
(8, 'Егорова Алиса Платоновна', '89994563842', 'login3', 'pass3', 'Заказчик'),
(9, 'Титов Максим Иванович', '89994563843', 'login4', 'pass4', 'Заказчик'),
(10, 'Иванов Марк Максимович', '89994563844', 'login5', 'pass5', 'Мастер');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`commentID`),
  ADD KEY `requestID` (`requestID`);

--
-- Индексы таблицы `repairs`
--
ALTER TABLE `repairs`
  ADD PRIMARY KEY (`requestID`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`userID`);

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`requestID`) REFERENCES `repairs` (`requestID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
