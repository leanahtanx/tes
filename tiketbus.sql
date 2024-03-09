-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 24 Feb 2024 pada 16.51
-- Versi Server: 5.6.21
-- PHP Version: 5.6.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `tiketbus`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `admin`
--

CREATE TABLE IF NOT EXISTS `admin` (
`id_admin` int(1) NOT NULL,
  `nama` varchar(32) NOT NULL,
  `username` varchar(16) NOT NULL,
  `password` varchar(16) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `admin`
--

INSERT INTO `admin` (`id_admin`, `nama`, `username`, `password`) VALUES
(1, 'Harmoko', 'admin', 'admin');

-- --------------------------------------------------------

--
-- Struktur dari tabel `bus`
--

CREATE TABLE IF NOT EXISTS `bus` (
  `no_pol` char(10) NOT NULL,
  `class` enum('Economy Class','Royal Class AC Eksekutif') NOT NULL,
  `nama_bus` varchar(32) NOT NULL,
  `kapasitas` int(2) NOT NULL,
  `ket` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `bus`
--

INSERT INTO `bus` (`no_pol`, `class`, `nama_bus`, `kapasitas`, `ket`) VALUES
('BK 3001 XY', 'Royal Class AC Eksekutif', 'Bintang Selatan 01', 45, 'Mobil Scania Listrik Terbaru dan Tercanggih, Full Musik, AC dan Film Layar Lebar'),
('BK 3002 XY', 'Economy Class', 'Bintang Selatan 02', 45, 'Mobil Scania Listrik Terbaru dan Tercanggih, Full Musik, Non AC'),
('BK 3003 XY', 'Royal Class AC Eksekutif', 'Bintang Selatan 03', 45, 'Mobil Scania Listrik Terbaru dan Tercanggih, Full Musik, AC dan Film Layar Lebar'),
('BK 3004 XY', 'Economy Class', 'Bintang Selatan 04', 45, 'Mobil Scania Listrik Terbaru dan Tercanggih, Full Musik, Non AC'),
('BK 3005 XY', 'Royal Class AC Eksekutif', 'Bintang Selatan 05', 45, 'Mobil Scania Listrik Terbaru dan Tercanggih, Full Musik, AC dan Film Layar Lebar');

-- --------------------------------------------------------

--
-- Struktur dari tabel `jadwal`
--

CREATE TABLE IF NOT EXISTS `jadwal` (
  `no_jadwal` char(6) NOT NULL,
  `no_pol` char(10) NOT NULL,
  `rute` varchar(50) NOT NULL,
  `harga` varchar(8) NOT NULL,
  `waktu` enum('07:00','08:00','09:00','10:00','11:00','12:00','13:00','14:00','15:00','16:00','17:00','18:00','19:00','20:00') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `jadwal`
--

INSERT INTO `jadwal` (`no_jadwal`, `no_pol`, `rute`, `harga`, `waktu`) VALUES
('JD-001', 'BK 3001 XY', 'Medan - Kisaran', '175000', '07:00'),
('JD-002', 'BK 3002 XY', 'Medan - Kisaran', '1250000', '17:00'),
('JD-003', 'BK 3003 XY', 'Medan - Parapat', '210000', '08:00'),
('JD-004', 'BK 3004 XY', 'Medan - Parapat', '75000', '15:00');

-- --------------------------------------------------------

--
-- Struktur dari tabel `rute`
--

CREATE TABLE IF NOT EXISTS `rute` (
  `kd_rute` varchar(16) NOT NULL,
  `asal` varchar(32) NOT NULL,
  `tujuan` varchar(64) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `rute`
--

INSERT INTO `rute` (`kd_rute`, `asal`, `tujuan`) VALUES
('MDN-KIS', 'Medan', 'Kisaran'),
('MDN-PRT', 'Medan', 'Parapat');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tiket`
--

CREATE TABLE IF NOT EXISTS `tiket` (
  `no_tiket` char(8) NOT NULL,
  `tgl_pesan` date NOT NULL,
  `nama_pemesan` varchar(32) NOT NULL,
  `tgl_tiket` date NOT NULL,
  `no_jadwal` char(6) NOT NULL,
  `jumlah` int(2) NOT NULL,
  `sub_total` int(8) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tiket`
--

INSERT INTO `tiket` (`no_tiket`, `tgl_pesan`, `nama_pemesan`, `tgl_tiket`, `no_jadwal`, `jumlah`, `sub_total`) VALUES
('TK-001', '2024-02-23', 'Sandra', '2024-02-29', 'JD-001', 2, 350000),
('TK-002', '2024-02-23', 'Hyande', '2024-02-29', 'JD-002', 4, 5000000),
('TK-003', '2024-02-23', 'Ginda', '2024-02-29', 'JD-001', 3, 350000),
('TK-004', '2024-02-23', 'Kato', '2024-02-29', 'JD-002', 6, 6250000);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
 ADD PRIMARY KEY (`id_admin`), ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `bus`
--
ALTER TABLE `bus`
 ADD PRIMARY KEY (`no_pol`);

--
-- Indexes for table `jadwal`
--
ALTER TABLE `jadwal`
 ADD PRIMARY KEY (`no_jadwal`);

--
-- Indexes for table `rute`
--
ALTER TABLE `rute`
 ADD PRIMARY KEY (`kd_rute`);

--
-- Indexes for table `tiket`
--
ALTER TABLE `tiket`
 ADD PRIMARY KEY (`no_tiket`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
MODIFY `id_admin` int(1) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
