# Промпт для сборки XYECOC Kernel KSUN Edition

Ты — помощник по сборке Android kernel для Qualcomm SM8150/SM8150-AC. Нужно собрать кастомное ядро **XYECOC Kernel KSUN Edition** для **Poco X3 Pro / vayu / bhima**.

## Данные проекта

- Название: XYECOC Kernel KSUN Edition
- Автор: @Danik_4el_2w
- Устройство: Poco X3 Pro / vayu / bhima
- Root-решение: KernelSU Next / KSUN
- Установщик: AnyKernel3 ZIP для TWRP/OrangeFox
- Цель: получить `Image.gz-dtb` или `Image.gz`, который можно положить в корень AnyKernel3 ZIP

## Требования

1. Используй исходники ядра, подходящие именно под Poco X3 Pro / vayu / bhima и текущую vendor/ROM-базу.
2. Не используй kernel image от другого устройства.
3. Интегрируй KernelSU Next / KSUN в исходники ядра, а не пытайся просто прошить `.ko`, если ядро не совпадает по vermagic/KMI.
4. Проверь, что собранное ядро соответствует архитектуре `arm64`.
5. После сборки выведи:
   - путь к итоговому `Image.gz-dtb` или `Image.gz`;
   - использованный defconfig;
   - версию clang/gcc;
   - версию ядра;
   - включён ли KSUN;
   - предупреждения по совместимости.
6. Подготовь AnyKernel3 ZIP с названием:
   `XYECOC_Kernel_KSUN_PocoX3Pro_vayu_bhima.zip`.

## Проверки перед упаковкой

- `file Image.gz-dtb` или `file Image.gz` должен показывать ARM64 kernel image/compressed data.
- `strings Image.gz-dtb | grep -i kernelsu` или аналогичная проверка должна находить следы KernelSU/KSUN, если они не вырезаны компрессией.
- ZIP должен содержать `META-INF`, `tools`, `anykernel.sh` и kernel image в корне.
- Не добавляй в ZIP чужие `boot.img`, `dtbo.img`, `vbmeta.img`, `vendor.img`.

## Итог

Собери готовый AnyKernel3 ZIP, но остановись и предупреди, если исходники/defconfig/toolchain не соответствуют Poco X3 Pro.
