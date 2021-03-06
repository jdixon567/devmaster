<?php

/**
 * Implements hook_hosting_queues()
 */
function devshop_projects_hosting_queues() {
  $items['deploy'] = array(
    'type' => 'batch',
    'name' => t('Deploy Queue'),
    'description' => t('Runs git pull and deploy hooks on projects configured to do so.'),
    'total_items' => count(devshop_projects_get_deploy_queue_environments()),
    'frequency' => strtotime("5 minutes", 0),
    'singular' => t('environment'),
    'plural' => t('environments'),
  );
  return $items;
}

/**
 * Get the environments to be pulled in the queue.
 *
 * @param $limit
 *   Limit to a maximum of this number of platforms.
 * @return
 *   An array of site nodes that have a pull queue enabled.
 *
 */
function devshop_projects_get_deploy_queue_environments() {

  $results = db_query("SELECT nid FROM {hosting_devshop_project}");
  $environments = array();
  while ($result = db_fetch_object($results)) {
    $node = node_load($result->nid);
    $project = $node->project;
    if ($project->settings->deploy['method'] == 'queue'){
      foreach ($project->environments as $environment) {
        if ($environment->git_ref_type == 'branch' && $environment->settings->pull_disabled == 0) {
          $environments[] = $environment;
        }
      }

    }
  }
  return $environments;
}

/**
 * Implements hosting_QUEUE_TYPE_queue().
 */
function hosting_deploy_queue($count) {
  $environments = devshop_projects_get_deploy_queue_environments($count);
  foreach ($environments as $environment) {
    $args = array();
    $args['git_ref'] = $environment->git_ref;
    $args['update'] = $environment->settings->deploy['update'];
    $args['revert'] = $environment->settings->deploy['revert'];
    $args['cache'] = $environment->settings->deploy['cache'];
    hosting_add_task($environment->site, 'devshop-deploy', $args);
  }
}
