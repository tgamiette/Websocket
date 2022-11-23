<?php

namespace App\Service;

use App\Entity\Chat;
use App\Entity\User;
use App\Repository\ChatRepository;
use Symfony\Component\Security\Core\Security;

class ChatHelper {
    public function __construct(private readonly ChatRepository $chatRepository, private readonly Security $security) {
    }

//


    public function hasAccessChat(Chat $chat): bool {

        $user = $this->security->getUser();
        $topic = explode('.', $chat->getTopic());
        if ($topic[0] === $user->getId() || $topic[1] === $user->getId()) {
            return true;
        }
        return false;
    }

    public function getChat(User $destinataire): Chat {

        dd($this->security->getUser());
        $array = [$destinataire->getId(), $this->security->getUser()->getId()];
        sort($array);
        $topic = implode('.', $array);
        $chat = $this->chatRepository->findOneBy(['topic' => $topic]);

        if (!$chat) {
            $chat = new Chat();
            $chat->setTopic($topic);
            return $chat;
        }


        return $chat;
    }
}