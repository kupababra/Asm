# 🖥️ Hacker Quotes Generator (NASM, x86-64, Linux)

A fun project in **NASM assembly** that prints a random
**geek / hacker / shellcode / exploit / reverse engineering saying**
every time you run it.

---

## 🇬🇧 English Version

### ✨ Features
- Pure **NASM assembly**.
- Uses `gettimeofday` (seconds + microseconds) for randomness.
- Database of **30 quotes** (hacking, shellcoding, exploits, reverse engineering).
- Prints **one random quote per run**.

### 📦 Build & Run
```bash
nasm -felf64 hacker_quotes_full.asm -o hacker_quotes_full.o
ld hacker_quotes_full.o -o hacker_quotes_full
./hacker_quotes_full
```

Example output:
```
Shellcode is poetry written in opcodes.
```

---

## 🇵🇱 Polska wersja

### ✨ Funkcje
- Napisane w czystym **assemblerze NASM**.  
- Wykorzystuje `gettimeofday` (sekundy + mikrosekundy) jako źródło losowości.  
- Baza **30 powiedzeń**: o hackingu, shellcodzie, exploitach i RE.  
- Wypisuje **jedno losowe powiedzenie przy każdym uruchomieniu**.  

### 📦 Kompilacja i uruchomienie
```bash
nasm -felf64 hacker_quotes_full.asm -o hacker_quotes_full.o
ld hacker_quotes_full.o -o hacker_quotes_full
./hacker_quotes_full
```

Przykładowy wynik:
```
Shellcode to poezja pisana w opcode’ach.
```

---

## 🧩 Jak dodać własne powiedzenia?
1. Dodaj nową linię w sekcji `.data`, np.:
```asm
q31 db "Nowa mądrość hakerska tutaj.",10,0
```
2. Dopisz do tablicy `quotes dq ...`.  
3. Zmień `n_quotes equ <nowa_liczba>`.  

---

## 🚀 Pomysły na rozwój
- Wypisywanie kilku cytatów naraz.  
- Kolorowe wyjście (ANSI escape codes).  
- Argumenty CLI (np. wybór kategorii cytatów).  

---

## 📜 Licencja
MIT – możesz używać, modyfikować i dzielić się dalej.
