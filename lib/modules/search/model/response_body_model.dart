// To parse this JSON data, do
//
//     final searchModel = searchModelFromJson(jsonString);

import 'dart:convert';

ResponseBodyModel searchModelFromJson(String str) => ResponseBodyModel.fromJson(json.decode(str));


class ResponseBodyModel {
    ResponseBodyModel({
        this.totalCount,
        this.incompleteResults,
        this.items,
    });

    int? totalCount;
    bool? incompleteResults;
    List<Item>? items;

    factory ResponseBodyModel.fromJson(Map<String, dynamic> json) => ResponseBodyModel(
        totalCount: json["total_count"],
        incompleteResults: json["incomplete_results"],
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
    );

   
}

class Item {
    Item({
        this.id,
        this.nodeId,
        this.name,
        this.fullName,
        this.private,
        
        this.htmlUrl,
        this.description,
        this.fork,
        this.url,
        this.forksUrl,
        this.keysUrl,
        this.collaboratorsUrl,
        this.teamsUrl,
        this.hooksUrl,
        this.issueEventsUrl,
        this.eventsUrl,
        this.assigneesUrl,
        this.branchesUrl,
        this.tagsUrl,
        this.blobsUrl,
        this.gitTagsUrl,
        this.gitRefsUrl,
        this.treesUrl,
        this.statusesUrl,
        this.languagesUrl,
        this.stargazersUrl,
        this.contributorsUrl,
        this.subscribersUrl,
        this.subscriptionUrl,
        this.commitsUrl,
        this.gitCommitsUrl,
        this.commentsUrl,
        this.issueCommentUrl,
        this.contentsUrl,
        this.compareUrl,
        this.mergesUrl,
        this.archiveUrl,
        this.downloadsUrl,
        this.issuesUrl,
        this.pullsUrl,
        this.milestonesUrl,
        this.notificationsUrl,
        this.labelsUrl,
        this.releasesUrl,
        this.deploymentsUrl,
        this.createdAt,
        this.updatedAt,
        this.pushedAt,
        this.gitUrl,
        this.sshUrl,
        this.cloneUrl,
        this.svnUrl,
        this.homepage,
        this.size,
        this.stargazersCount,
        this.watchersCount,
        this.language,
        this.hasIssues,
        this.hasProjects,
        this.hasDownloads,
        this.hasWiki,
        this.hasPages,
        this.forksCount,
        this.mirrorUrl,
        this.archived,
        this.disabled,
        this.openIssuesCount,
        this.allowForking,
        this.isTemplate,
        this.webCommitSignoffRequired,
        this.topics,
        
        this.forks,
        this.openIssues,
        this.watchers,
        this.score,
    });

    int? id;
    String? nodeId;
    String? name;
    String? fullName;
    bool? private;
    
    String? htmlUrl;
    String? description;
    bool? fork;
    String? url;
    String? forksUrl;
    String? keysUrl;
    String? collaboratorsUrl;
    String? teamsUrl;
    String? hooksUrl;
    String? issueEventsUrl;
    String? eventsUrl;
    String? assigneesUrl;
    String? branchesUrl;
    String? tagsUrl;
    String? blobsUrl;
    String? gitTagsUrl;
    String? gitRefsUrl;
    String? treesUrl;
    String? statusesUrl;
    String? languagesUrl;
    String? stargazersUrl;
    String? contributorsUrl;
    String? subscribersUrl;
    String? subscriptionUrl;
    String? commitsUrl;
    String? gitCommitsUrl;
    String? commentsUrl;
    String? issueCommentUrl;
    String? contentsUrl;
    String? compareUrl;
    String? mergesUrl;
    String? archiveUrl;
    String? downloadsUrl;
    String? issuesUrl;
    String? pullsUrl;
    String? milestonesUrl;
    String? notificationsUrl;
    String? labelsUrl;
    String? releasesUrl;
    String? deploymentsUrl;
    DateTime? createdAt;
    DateTime? updatedAt;
    DateTime? pushedAt;
    String? gitUrl;
    String? sshUrl;
    String? cloneUrl;
    String? svnUrl;
    String? homepage;
    int? size;
    int? stargazersCount;
    int? watchersCount;
    String? language;
    bool? hasIssues;
    bool? hasProjects;
    bool? hasDownloads;
    bool? hasWiki;
    bool? hasPages;
    int? forksCount;
    dynamic mirrorUrl;
    bool? archived;
    bool? disabled;
    int? openIssuesCount;
    bool? allowForking;
    bool? isTemplate;
    bool? webCommitSignoffRequired;
    List<String>? topics;
    
    int? forks;
    int? openIssues;
    int? watchers;
    int? score;

    factory Item.fromJson(Map<String, dynamic> json) => Item(
        id: json["id"],
        nodeId: json["node_id"],
        name: json["name"],
        fullName: json["full_name"],
        private: json["private"],
        
        htmlUrl: json["html_url"],
        description: json["description"],
        fork: json["fork"],
        url: json["url"],
        forksUrl: json["forks_url"],
        keysUrl: json["keys_url"],
        collaboratorsUrl: json["collaborators_url"],
        teamsUrl: json["teams_url"],
        hooksUrl: json["hooks_url"],
        issueEventsUrl: json["issue_events_url"],
        eventsUrl: json["events_url"],
        assigneesUrl: json["assignees_url"],
        branchesUrl: json["branches_url"],
        tagsUrl: json["tags_url"],
        blobsUrl: json["blobs_url"],
        gitTagsUrl: json["git_tags_url"],
        gitRefsUrl: json["git_refs_url"],
        treesUrl: json["trees_url"],
        statusesUrl: json["statuses_url"],
        languagesUrl: json["languages_url"],
        stargazersUrl: json["stargazers_url"],
        contributorsUrl: json["contributors_url"],
        subscribersUrl: json["subscribers_url"],
        subscriptionUrl: json["subscription_url"],
        commitsUrl: json["commits_url"],
        gitCommitsUrl: json["git_commits_url"],
        commentsUrl: json["comments_url"],
        issueCommentUrl: json["issue_comment_url"],
        contentsUrl: json["contents_url"],
        compareUrl: json["compare_url"],
        mergesUrl: json["merges_url"],
        archiveUrl: json["archive_url"],
        downloadsUrl: json["downloads_url"],
        issuesUrl: json["issues_url"],
        pullsUrl: json["pulls_url"],
        milestonesUrl: json["milestones_url"],
        notificationsUrl: json["notifications_url"],
        labelsUrl: json["labels_url"],
        releasesUrl: json["releases_url"],
        deploymentsUrl: json["deployments_url"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        pushedAt: DateTime.parse(json["pushed_at"]),
        gitUrl: json["git_url"],
        sshUrl: json["ssh_url"],
        cloneUrl: json["clone_url"],
        svnUrl: json["svn_url"],
        homepage: json["homepage"] == null ? null : json["homepage"],
        size: json["size"],
        stargazersCount: json["stargazers_count"],
        watchersCount: json["watchers_count"],
        language: json["language"],
        hasIssues: json["has_issues"],
        hasProjects: json["has_projects"],
        hasDownloads: json["has_downloads"],
        hasWiki: json["has_wiki"],
        hasPages: json["has_pages"],
        forksCount: json["forks_count"],
        mirrorUrl: json["mirror_url"],
        archived: json["archived"],
        disabled: json["disabled"],
        openIssuesCount: json["open_issues_count"],
        allowForking: json["allow_forking"],
        isTemplate: json["is_template"],
        webCommitSignoffRequired: json["web_commit_signoff_required"],
        topics: List<String>.from(json["topics"].map((x) => x)),
        
        forks: json["forks"],
        openIssues: json["open_issues"],
        watchers: json["watchers"],
        score: json["score"],
    );

    
        
}







    







