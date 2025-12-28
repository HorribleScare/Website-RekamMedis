-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 28, 2025 at 11:25 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_rekamedis`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_obat`
--

CREATE TABLE `tbl_obat` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `kegunaan` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_obat`
--

INSERT INTO `tbl_obat` (`id`, `nama`, `kegunaan`) VALUES
(1, 'Paracetamol', 'Meredakan demam dan mengurangi nyeri ringan.'),
(2, 'Revanol', 'Membersihkan luka dan mencegah infeksi pada luka ringan.'),
(3, 'Amoksisilin', 'Mengobati infeksi akibat bakteri.'),
(4, 'Magnesium Hidroksida', 'Meredakan asam lambung dan mengatasi sembelit.'),
(5, 'Omeprazole', 'Mengurangi produksi asam lambung.'),
(6, 'Diclofenac', 'Meredakan peradangan, nyeri, dan demam.'),
(7, 'Piroxicam', 'Meredakan rematik, asam urat, dan nyeri haid.'),
(8, 'Ibuprofen', 'Mengurangi peradangan dan menurunkan demam.');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_pasien`
--

CREATE TABLE `tbl_pasien` (
  `id` varchar(20) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `tgl_lahir` date NOT NULL,
  `gender` enum('P','W') NOT NULL,
  `telpon` varchar(15) NOT NULL,
  `alamat` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_pasien`
--

INSERT INTO `tbl_pasien` (`id`, `nama`, `tgl_lahir`, `gender`, `telpon`, `alamat`) VALUES
('250902060432', 'Deddy Corbuzier', '1976-12-28', 'P', '081211459958', 'Bintaro'),
('250902060735', 'Nina Carolina', '1987-03-12', 'W', '081283806100', 'Ciganjur'),
('250903044142', 'Ryu Kintaro', '2015-04-04', 'P', '085171000855', 'Jakarta');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_rekamedis`
--

CREATE TABLE `tbl_rekamedis` (
  `no_rm` varchar(15) NOT NULL,
  `tgl_rm` date NOT NULL,
  `id_pasien` varchar(20) NOT NULL,
  `keluhan` text NOT NULL,
  `id_dokter` int(11) NOT NULL,
  `diagnosa` text NOT NULL,
  `obat` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_rekamedis`
--

INSERT INTO `tbl_rekamedis` (`no_rm`, `tgl_rm`, `id_pasien`, `keluhan`, `id_dokter`, `diagnosa`, `obat`) VALUES
('RM-001-070925', '2025-09-07', '250902060432', 'Sakit perut, mual, dan tidak nafsu makan.', 4, 'Radang lambung', 'Amoksisilin, Magnesium Hidroksida, Omeprazole'),
('RM-001-280925', '2025-09-28', '250902060735', 'Sakit perut, mual, dan tidak nafsu makan.', 3, 'Radang lambung', 'Amoksisilin, Magnesium Hidroksida, Omeprazole'),
('RM-002-070925', '2025-09-07', '250903044142', 'Muntah, sakit perut, dan tidak nafsu makan.', 4, 'Maag kronis', 'Paracetamol, Diclofenac');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user`
--

CREATE TABLE `tbl_user` (
  `userid` int(11) NOT NULL,
  `username` varchar(30) NOT NULL,
  `fullname` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `jabatan` enum('1','2','3') NOT NULL COMMENT '1=administrator, 2=petugas, 3=dokter',
  `alamat` varchar(100) NOT NULL,
  `gambar` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_user`
--

INSERT INTO `tbl_user` (`userid`, `username`, `fullname`, `password`, `jabatan`, `alamat`, `gambar`) VALUES
(1, 'admin', 'Administrator', '$2y$10$yId5SOc/2p/71FSS4P61qO5Gy0cuXrFL7YOMh69HUebLQ9s61x9lC', '1', 'Jakarta Utara', '1756446505-admin.png'),
(2, 'david', 'David Hariadi', '$2y$10$K34graIIABD60HDKIHPsC.128LbG75jTO80npHK7XNJC3bAFWU77a', '2', 'Jakarta Utara', '1756446706-petugas.jpg'),
(3, 'djaja', 'Djaja Surya Atmadja', '$2y$10$2B4Mv2nEnjELBwVdszRgVuZ8.gsU.KO1kLbYVck9mMOLovwF.Uuf.', '3', 'Jakarta Pusat', '1756447205-dokter.jpg'),
(4, 'tirta', 'Tirta Mandira Hundhi', '$2y$10$Z7WfsjMAWXYhH9Ksj3ROR.s6bD5plwFHUAwGYYtWGLO4K1eS1p4Ja', '3', 'Surakarta', '1756453844-dokter2.jpg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_obat`
--
ALTER TABLE `tbl_obat`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_pasien`
--
ALTER TABLE `tbl_pasien`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_rekamedis`
--
ALTER TABLE `tbl_rekamedis`
  ADD PRIMARY KEY (`no_rm`),
  ADD KEY `id_pasien` (`id_pasien`),
  ADD KEY `id_dokter` (`id_dokter`);

--
-- Indexes for table `tbl_user`
--
ALTER TABLE `tbl_user`
  ADD PRIMARY KEY (`userid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_obat`
--
ALTER TABLE `tbl_obat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tbl_user`
--
ALTER TABLE `tbl_user`
  MODIFY `userid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_rekamedis`
--
ALTER TABLE `tbl_rekamedis`
  ADD CONSTRAINT `tbl_rekamedis_ibfk_1` FOREIGN KEY (`id_pasien`) REFERENCES `tbl_pasien` (`id`),
  ADD CONSTRAINT `tbl_rekamedis_ibfk_2` FOREIGN KEY (`id_dokter`) REFERENCES `tbl_user` (`userid`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
