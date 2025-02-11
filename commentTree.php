<?php
function buildTree(array $comments): array {
    $items = [];

    foreach ($comments as $comment) {
        $comment['children'] = [];
        $items[$comment['id']] = $comment;
    }

    $tree = [];

    foreach ($items as $id => &$node) {
        if ($node['parent_id'] != $node['id'] && isset($items[$node['parent_id']])) {
            $items[$node['parent_id']]['children'][] = &$node;
        } else {
            $tree[] = &$node;
        }
    }
    unset($node);
    return $tree;
}

function renderComments(array $comments, int $depth = 0): string {
    $html = '';
    foreach ($comments as $comment) {
        $indent = str_repeat('&nbsp;', $depth * 4);
        $html .= $indent . htmlspecialchars($comment['comment']) . "<br>\n";
        if (!empty($comment['children'])) {
            $html .= renderComments($comment['children'], $depth + 1);
        }
    }
    return $html;
}

$comments = [
    ['id' => 1, 'parent_id' => 1, 'comment' => 'Comment 1'],
    ['id' => 2, 'parent_id' => 1, 'comment' => 'Comment 2'],
    ['id' => 3, 'parent_id' => 2, 'comment' => 'Comment 3'],
    ['id' => 4, 'parent_id' => 1, 'comment' => 'Comment 4'],
    ['id' => 5, 'parent_id' => 2, 'comment' => 'Comment 5'],
    ['id' => 6, 'parent_id' => 3, 'comment' => 'Comment 6'],
    ['id' => 7, 'parent_id' => 7, 'comment' => 'Comment 7'],
];

$tree = buildTree($comments);

echo renderComments($tree);
?>