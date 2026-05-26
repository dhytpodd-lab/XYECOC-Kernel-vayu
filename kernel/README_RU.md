# XYECOC Kernel KSUN Edition

**Устройство:** Poco X3 Pro / vayu / bhima  
**Автор:** @Danik_4el_2w  
**Installer:** AnyKernel3  
**Root:** KernelSU Next / KSUN target  

## Статус

Это **шаблон AnyKernel3 ZIP**, а не готовое ядро. Он оформлен под XYECOC Kernel и содержит защиту: если в корне ZIP нет настоящего скомпилированного kernel image, установка будет остановлена.

Чтобы сделать ZIP реально прошиваемым, положи в корень архива один из файлов:

```text
Image.gz-dtb
Image.gz
Image
```

Для Poco X3 Pro обычно нужен kernel image, собранный из исходников именно под **vayu/bhima** и под твою текущую vendor/ROM-базу.

## Почему android16-6.12_kernelsu.ko не установлен автоматически

В архив добавлен файл:

```text
extras/ksun_lkm_reference/android16-6.12_kernelsu.ko
```

Он лежит только как **reference-файл**. По modinfo у него vermagic:

```text
6.12.76-4k-gae4e2f4f997e-dirty SMP preempt mod_unload modversions aarch64
```

Такой `.ko` можно грузить только на ядре с совместимой версией, конфигом и symbol versions. Для обычного Poco X3 Pro он почти наверняка не подойдёт, если ядро не собрано как Android 16 / Linux 6.12 с тем же KMI.

## Что надо сделать для настоящего XYECOC Kernel

1. Взять исходники ядра под Poco X3 Pro / vayu / bhima.
2. Интегрировать KernelSU Next / KSUN в исходники.
3. Включить нужные опции конфигурации ядра.
4. Собрать kernel image: `Image.gz-dtb` или `Image.gz`.
5. Положить собранный image в корень этого AnyKernel3 ZIP.
6. Прошивать через TWRP/OrangeFox только после бэкапа `boot.img`.

## Безопасность

Не прошивай ZIP, пока не добавлен настоящий kernel image. Шаблон должен сам остановить установку, но лучше не рисковать.

Перед прошивкой сохрани текущий boot:

```sh
dd if=/dev/block/by-name/boot of=/sdcard/boot_backup_xyecoc.img
```

Или заранее держи рабочий `boot.img` для восстановления через fastboot:

```bat
fastboot flash boot boot.img
fastboot reboot
```
