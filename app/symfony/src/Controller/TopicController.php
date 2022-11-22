<?php

namespace App\Controller;

use App\Entity\Message;
use App\Entity\Topic;
use App\Entity\User;
use App\Repository\TopicRepository;
use App\Repository\UserRepository;
use Doctrine\ORM\EntityManagerInterface;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\IsGranted;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\Routing\Annotation\Route;

class TopicController extends AbstractController
{
    #[Route('/topic/{topic}', name: 'topic_getMessages', methods: 'GET')]
    #[IsGranted('ROLE_USER')]
    public function getTopicMessages(TopicRepository $topicRepository, $topic): JsonResponse
    {
        $user = $this->getUser();
        $topic = $topicRepository->findOneBy(['topic'=> $topic]);
        $messageCollection = $topic->getMessages();

        return $this->json(['message'=>$messageCollection],context: ['group'=>'default']);
    }

    #[Route('/topic/{id}/send-message', name: 'topic_sendMessage', methods: 'POST')]
    public function sendMessage(TopicRepository $topicRepository, $id,EntityManagerInterface $em,UserRepository $repository)
    {
        /** @var User $user */
        $userLogged = $this->getUser();
        $user = $repository->findOneBy(['id'=> $id]);

        $topic = new Topic();
        $topic->setTopic($user->getId().'.'.$userLogged->getId());

        $em->persist($topic);

        $message = new Message();
        $message
            ->setTopic($topic)
            ->setUser($user)
            ->setContent('');

        $em->persist($message);
        $em->flush();
    }
}