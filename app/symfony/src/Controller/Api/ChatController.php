<?php

namespace App\Controller\Api;

use App\Entity\Message;
use App\Entity\User;
use App\Repository\ChatRepository;
use App\Service\ChatHelper;
use Doctrine\ORM\EntityManagerInterface;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\IsGranted;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpKernel\Exception\HttpException;
use Symfony\Component\Routing\Annotation\Route;

#[Route('/api/chat', name: 'api_chat_')]
class ChatController extends AbstractController {
    public function __construct(private ChatHelper $chatHelper, private EntityManagerInterface $em) {
    }

    #[Route('/{topic}', name: 'chat_getMessages', methods: 'GET')]
    #[IsGranted('ROLE_USER')]
    public function getTopicMessages(ChatRepository $chatRepository, string $topic): JsonResponse {
        $chat = $chatRepository->findOneByTopic($topic);

        if (!$chat) {
            throw new HttpException(Response::HTTP_NOT_FOUND);
        }

        $this->chatHelper->hasAccessChat($chat);
        $messageCollection = $chat->getMessages();


        return $this->json(['message' => $messageCollection], context: ['groups' => 'get:chat']);
    }

    #[Route('/send-message', name: 'chat_sendMessage', methods: 'POST')]
    public function createMessage(Request $request) {
        $content = $request->get('content');
        $recipientName = $request->get('recipient');

        /** @var User $userLogged */
        $userLogged = $this->getUser();
        $recipient = $this->em->getRepository(User::class)->findOneBy(['username' => $recipientName]);
        $chat = $this->chatHelper->getChat($recipient);

        //helper pour check s'il a bien les droits pour envoyer un message sur ce chat
        $this->chatHelper->hasAccessChat($chat);


        $message = new Message();
        $message
            ->setChat($chat)
            ->setUser($userLogged)
            ->setContent($content)
            ->setCreatedAt(new \DateTimeImmutable())
            ->setUpdatedAt(new \DateTimeImmutable());

        $this->em->persist($message);
        $this->em->flush();

        return $this->json(['message' => "Message envoye"], context: ['group' => 'default']);
    }
}
