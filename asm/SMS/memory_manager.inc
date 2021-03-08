.memorymap
  defaultslot 2
  slotsize $4000
  slot 0 $0000
  slot 1 $4000
  slot 2 $8000
  slotsize $2000
  slot 3 $C000
.endme

  .rombankmap ; 256K rom
    bankstotal 16
    banksize $4000
    banks 16
  .endro