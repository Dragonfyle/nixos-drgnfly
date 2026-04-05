# Aliases
alias gpf "git remote prune origin; git fetch"

# Abbreviations
if command -q gh
    abbr --add issue gh issue
    abbr --add issues gh issue list
    abbr --add issuev gh issue view
    abbr --add issuee gh issue
    abbr --add pr gh pr
    abbr --add prs gh pr list
    abbr --add prv gh pr view
    abbr --add pre gh pr edit
    abbr --add prcr gh pr create
end

abbr --add ga git add
abbr --add gst git status
abbr --add glogn git log --graph --oneline -n
abbr --add gco git checkout
abbr --add grc git restore --staged
abbr --add gmm git commit -m
abbr --add gwta git worktree add
abbr --add gwtr git worktree remove
abbr --add gwtl git worktree list

# Functions
if command -q fzf
    function gbp
        # List branches (local only); trim the leading "* " from the current one
        set -l branch (git branch --all 2>/dev/null \
            | sed 's/^[* ]*//' \
            | fzf)

        if test -n "$branch"
            # For remote branches like "remotes/origin/foo", strip the prefix
            set branch (string replace -r '^remotes/[^/]+/' '' -- "$branch")
            git switch "$branch"
        end
    end
end
