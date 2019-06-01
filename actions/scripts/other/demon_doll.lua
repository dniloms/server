function onUse(cid, item, itemEx)
    doSendMagicEffect(itemEx, 14)
    doPlayerSendTextMessage(cid, 22, "Parabéns você ganhou a outfit Deidara.")
    doPlayerAddOutfit(cid, 541, 0) ---->vc precisa pegar o storage do addon q vc quer, eles se encontram no outfit.xml
    doPlayerAddOutfit(cid, 542, 0) ----> versao male e female, o 0 é o addon q vem, se botar 1 vem só com o primeiro addon, 2 só com o segundo e 3 com os 2
    doRemoveItem(item.uid, 1)
           return TRUE
end