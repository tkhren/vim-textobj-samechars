## vim-textobj-samechars

Text objects for continuous characters

## Installation

This plugin depends on [kana/vim-textobj-user](https://github.com/kana/vim-textobj-user).

### NeoBundle

```
NeoBundle 'kana/vim-textobj-user'
NeoBundle 'tkhren/vim-textobj-samechars'
```

## Usage

### Text objects

| Textobj    | Description                                                        |
|:-----------|:-------------------------------------------------------------------|
| `ic`, `ac` | Select the continuous characters under the cursor                  |



## Example
Type `dic` on a text `Gooooooooooo|ooooooooooogle`, that results in `G|gle`  
 (`|` is the cursor)